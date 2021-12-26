import sequtils
import strutils
import strformat
import xmltree
import xmlparser
import sugar
import os
import options

import ./nodedefs

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

proc filter*[T](s: openArray[T], pred: proc(i: Natural, x: T): bool {.closure.}): seq[T]
                                                                  {.inline.} =
  result = newSeq[T]()
  for i in 0 ..< s.len:
    if pred(i, s[i]):
      result.add(s[i])

#               00
#       01              02
#   03      04      05      06
# 07  08  09  10  11  12  13  14
#  2i+1 = i_right
#  2i+2 = i_left
type
  Sbt*[T] = ref object # String Binary Tree
    tree*: seq[tuple[id: string; item: T]]
proc nextCapacity*(x: Natural = 0): Natural =
  if x < 10: 10
  else: 2 * x
proc newSbt*[T](): Sbt[T] =
  new result
  result.tree.setLen(nextCapacity())
# proc add*[T](sbt: Sbt[T]; item: T) =

# general ==============================================================
# ----------------------------------------------------------------------
# specialization =======================================================

proc getVulkanXML*(): XmlNode {.inline.} = readFile("vk.xml").parseXml()

proc toUpperCamel*(str: string): string =
  str.split('_').mapIt(it.toLowerAscii().capitalizeAscii()).join()
proc toLowerCamel*(str: string): string =
  result = str.toUpperCamel
  return ($result[0].toLowerAscii) & result[1..^1]

proc toLowerInitial*(str: string): string =
  str[0].toLowerAscii & str[1..^1]

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

proc parseEnumValue*(str: string; enumsName: string; vendorTags: VendorTags): string =
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
      result = &"e{result}"
  except: return

  result = result.toLowerInitial.replace("Bit", "")

  return case result
  of "object": "`object`"
  of "and": "`and`"
  of "xor": "`xor`"
  of "or": "`or`"
  else: result

proc replaceBasicTypes*(str: string): string =
  str
    .replace("Vk", "")
    .replace("vk", "")
    .replace("HANDLE", "Win32Handle")
    .replace("int64_t", "int64")
    .replace("int32_t", "int32")
    .replace("int16_t", "int16")
    .replace("int8_t", "int8")
    .replace("size_t", "uint") # uint matches pointer size just like size_t
    .replace("float", "float32")
    .replace("double", "float64")
    .replace("double", "float64")
    .replace("xcb_window_t", "XcbWindow")
    .replace("xcb_connection_t", "XcbConnection")
    .replace("xcb_visualid_t", "XcbVisualid")

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

proc parseVariableNameFromSnake*(str: string): string =
  str.removeVkPrefix.toUpperCamel

proc parseParamName*(str: string): string =
  case str
  of "type": "theType"
  of "object": "`object`"
  else: str

proc parseTypeName*(str: string): string =
  str
    .replaceBasicTypes
    .replacePtrTypes
proc parseTypeName*(str: string; ptrLv: Natural): string =
  ("ptr ".repeat(ptrLv) & str).parseTypeName
proc parseTypeName*(str: string; ptrLen: seq[Option[string]]): string =
  result = str.parseTypeName(ptrLen.len)
  let newPtrlv = result.count("ptr ")
  return "arrPtr[".repeat(newPtrlv) & result.replace("ptr ", "") & "]".repeat(newPtrlv)
proc parseTypeName*(str: string; dim: seq[NodeArrayDimention]): string =
  str.parseTypeName()
    .pipe(x => dim.mapIt(
        if it.useConst: it.name.parseVariableNameFromSnake
        else: $it.value)
      .concat(@[x])
      .foldr("array[{a}, {b}]".fmt))

proc parseFileName*(str: string): string =
  case str
  of "VK_VERSION_1_0": "features/vk10"
  of "VK_VERSION_1_1": "features/vk11"
  of "VK_VERSION_1_2": "features/vk12"
  else: "extensions"/str

proc filterInvalidArgParams*[T](s: openArray[T]): seq[T] =
  s.filterIt(it notin ["const", "unsigned", "signed", "struct", "typedef", "VKAPI_PTR"])

proc filterByCategory*[T](s: openArray[T]; strs: varargs[string]): seq[T] =
  s.filterIt(it{"category"} in strs)

template `{}`*(xmlNode: XmlNode, attrStr: string): untyped =
  xmlNode.attr(attrStr)
template name*(xmlNode: XmlNode): untyped = xmlNode{"name"}
template value*(xmlNode: XmlNode): untyped = xmlNode{"value"}
template alias*(xmlNode: XmlNode): untyped = xmlNode{"alias"}
template comment*(xmlNode: XmlNode): untyped = xmlNode{"comment"}
template category*(xmlNode: XmlNode): untyped = xmlNode{"category"}
template `[]`*(xmlNode: XmlNode, childStr: string): untyped =
  xmlNode.child(childStr)
template `?`*(str: string): Option[string] =
  if str.isEmptyOrWhitespace: none(string)
  else: some(str)