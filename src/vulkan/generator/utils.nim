import sequtils
import strutils
import strformat
import xmltree
import xmlparser
import sugar
import os
import osproc
import streams
import options

proc pipe*[T, S](arg: T; op: proc(arg: T): S): S =
  runnableExamples:
    import sugar, math
    var res: int = (() => @[1, 2, 3, 4, 5])()
      .pipe(s => s.sum)
      .pipe(v => v*2)
    doAssert res == 30
  op(arg)
proc pipe*[T](arg: T; op: proc(arg: T)) =
  runnableExamples:
    import sugar, math
    var res: int
    (() => @[1, 2, 3, 4, 5])()
      .pipe(s => s.sum)
      .pipe(proc(v: int) = (res = v*2))
    doAssert res == 30
  op(arg)

proc `|>`*[T, S](arg: T; op: proc(arg: T): S): S =
  runnableExamples:
    import sugar, math
    var res: int = (() => @[1, 2, 3, 4, 5])() |>
      (s => s.sum) |>
      (v => v*2)
    doAssert res == 30
  op(arg)
proc `|>`*[T](arg: T; op: proc(arg: T)) =
  runnableExamples:
    import sugar, math
    var res: int
    (() => @[1, 2, 3, 4, 5])() |>
      (s => s.sum) |>
      proc(v: int) = (res = v*2)
    doAssert res == 30
  op(arg)

proc attrOrNone*(node: XmlNode; attrName: string): Option[string] =
  let attribute = node.attr(attrName)
  if not attribute.isEmptyOrWhitespace:
    return some(attribute)

template find*[T](arr: openArray[T]; op: proc(x: T): bool {.closure.})  =
  arr.filter(op)[0]

template findIt*(s, pred: untyped): untyped  =
  var result: typeof(s[0])
  for it {.inject.} in items(s):
    if pred:
      result = it
      break
  result

template LF*(str: string): string = str & "\n"
template LF*(str: var string) = str &= "\n"

proc commentify*(str: string): string =
  const commentSign = "# "
  str
    .split("\n")
    .mapIt(block:
      if it.len >= 3 and it[0..2] == "// ": commentSign & it[3..^1]
      else: commentSign & it)
    .join("\n")

proc underline*(str: string; pattern: char): string =
  str & "\n" &
  pattern.repeat(str.split("\n").mapIt(it.len).foldl(max(a, b)))

proc parseWords*(str: string; ignore: set[char] = {}; start: Natural = 0): seq[string] =
  const ignoreCharsDefault = {' ', '\t', '\v', '\r', '\l', '\f', '\n', '\0'}
  let ignoreChars = ignoreCharsDefault + ignore
  template skipIgnoreChars(idx: int): untyped =
    while idx < str.len and str[idx] in ignoreChars:
      inc idx
  template getIdentEnd(idx: int): untyped =
    while idx < str.len and str[idx] notin ignoreChars:
      inc idx
  var newStart = start

  while newStart < str.len:
    var identStart = newStart
    skipIgnoreChars(identStart)
    var identEnd = identStart
    getIdentEnd(identEnd)

    if identStart == identEnd: return

    result.add str.substr(identStart, identEnd-1)
    newStart = identEnd

proc parseStatement*(str: string): string =
  const IgnoreChars = {' ', '\t', '\v', '\r', '\l', '\f', '\n', '\r'}
  var cStart = str.low
  while cStart <= str.high:
    if str[cStart] notin IgnoreChars: break
    else: inc cStart

  var cLast = str.high
  while cLast >= cStart:
    if str[cLast] notin IgnoreChars: break
    else: dec cLast

  if cStart > cLast:
    return ""

  str.substr(cStart, cLast)


# general ==============================================================
# ----------------------------------------------------------------------
# specialization =======================================================

proc getVulkanXML*(): XmlNode =
  if not os.fileExists("vk.xml"):
    discard execCmd "curl https://raw.githubusercontent.com/KhronosGroup/Vulkan-Docs/master/xml/vk.xml > vk.xml"

  let file = newFileStream("vk.xml", fmRead)
  defer: file.close()
  file.parseXml()

proc toUpperCamel*(str: string): string =
  str.split('_').mapIt(it.toLowerAscii().capitalizeAscii()).join()
proc toLowerCamel*(str: string): string =
  result = str.toUpperCamel
  return ($result[0].toLowerAscii) & result[1..^1]

proc toLowerInitial*(str: string): string =
  str[0].toLowerAscii & str[1..^1]

type VendorTags* = seq[tuple[name: string]]

proc removeTerminalUnderScore*(str: string): string =
  result = str
  while true:
    if result.len == 0: break
    if result[^1] == '_': result = result[0..^2]
    else: break
  return
proc removeVkPrefix*(str: string): string =
  str
    .replace("PFN_vk", "")
    .replace("VK_", "")
    .replace("Vk", "")
    .replace("vk", "")
proc removeVendorTags*(str: string; vendorTags: VendorTags): string =
  for vendorTag in vendorTags:
    if vendorTag.name.len <= str.len:
      if str.toUpperAscii.find(vendorTag.name.toUpperAscii, str.len-vendorTag.name.len) != -1:
        return str[0..<(str.len-vendorTag.name.len)]
  return str
proc removeSuffix*(str, suffix: string): string =
  var str = str
  str.removeSuffix(suffix)
  return str

proc parseEnumName*(str: string; enumsName: string; vendorTags: VendorTags): string =
  let removablePrefix = enumsName
    .removeVkPrefix
    .removeVendorTags(vendorTags)
    .removeTerminalUnderScore
    .removeSuffix("FlagBits")
  result = str
    .toUpperCamel
    .removeVkPrefix

  let pos = result.find(removablePrefix)
  if pos != -1:
    result = result[(pos+removablePrefix.len)..^1]
  try:
    if result[0].isDigit:
      result = &"Vk{result}"
  except: return

  var tmp = result.removeVendorTags(vendorTags)
  if tmp != "": result = tmp
  result.removeSuffix("Bit")

proc replaceBasicTypes*(str: string): string =
  str
    .replace("Vk", "")
    .replace("vk", "")
    .replace("PFN_", "")
    .replace("int64_t", "int64")
    .replace("int32_t", "int32")
    .replace("int16_t", "int16")
    .replace("int8_t", "int8")
    .replace("size_t", "uint") # uint matches pointer size just like size_t
    .replace("float", "float32")
    .replace("double", "float64")
    .replace("double", "float64")

proc replacePtrTypes*(str: string): string =
  str
    .replace("* ", "*")
    .replace("*", "ptr ")
    .replace("ptr ptr char", "cstringArray")
    .replace("ptr char", "cstring")
    .replace("ptr void", "pointer")
proc normal2pointer*(str: string): string =
  ("ptr " & str)
    .replace("ptr ptr char", "cstringArray")
    .replace("ptr char", "cstring")
    .replace("ptr void", "pointer")

proc parseCommandName*(str: string): string =
  str.removeVkPrefix.toLowerInitial
proc parseCommandNameFromSnake*(str: string): string =
  str.removeVkPrefix.toLowerCamel

proc parseParamName*(str: string): string =
  if str == "type": "theType"
  else: str

proc parseTypeName*(str: string; ptrLv: Natural = 0; arrayLen: seq[Natural] = @[]): string =
  ("ptr ".repeat(ptrLv) & str)
    .replaceBasicTypes
    .replacePtrTypes
    .pipe(x => arrayLen
      .mapIt($it)
      .concat(@[x])
      .foldr("array[{a}, {b}]".fmt))

proc filterInvalidArgParams*[T](s: openArray[T]): seq[T] =
  s.filterIt(it notin ["const", "unsigned", "signed", "struct", "typedef", "VKAPI_PTR"])

proc filterByCategory*[T](s: openArray[T]; strs: varargs[string]): seq[T] =
  s.filterIt(it{"category"} in strs)

template `{}`*(xmlNode: XmlNode, attrStr: string): untyped =
  xmlNode.attr(attrStr)
template name*(xmlNode: XmlNode): untyped = xmlNode{"name"}
template comment*(xmlNode: XmlNode): untyped = xmlNode{"comment"}
template category*(xmlNode: XmlNode): untyped = xmlNode{"category"}
template `[]`*(xmlNode: XmlNode, childStr: string): untyped =
  xmlNode.child(childStr)
template `?`*(str: string): Option[string] =
  if str.isEmptyOrWhitespace: none(string)
  else: some(str)
# template `?[]`*(xmlNode: XmlNode, attrStr: string): untyped =
#   xmlNode.attrOrNone(attrStr)

const
  enumPragma* = "{.size: sizeof(int32), pure.}"
  commandPragma* = "{.cdecl.}"