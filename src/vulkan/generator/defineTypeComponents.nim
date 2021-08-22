import xmltree
import strutils
import sequtils
import strformat
import tables
import ./utils
proc genVkHeaderVersion*(typeDef: XmlNode): string =
  var version: int
  for child in typeDef:
    try:
      version = child.innerText.parseStatement.parseInt
      if version != 0: break
    except: continue
  result = "template headerVersion*(): untyped = {version}".fmt
proc genVkHeaderVersionComplete*(typeDef: XmlNode): string =
  var args: string
  var isNextOfType: bool
  for c in typeDef:
    if isNextOfType:
      args = c.innerText.parseWords()
        .mapIt(it.parseCommandNameFromSnake)
        .join(" ")
      break
    if c.kind == xnElement and c.tag == "type":
      isNextOfType = true
  result =
    "template headerVersionComplete*(): untyped =\n" &
    "  makeVersion{args}".fmt
proc genDefineHandle*(typeDef: XmlNode): string =
    "template defineHandle*(ObjectName: untyped) =\n" &
    "  type ObjectName* = distinct pointer"
proc genDefineNonDispatchableHandle*(typeDef: XmlNode): string =
    "template defineNonDispatchableHandle*(ObjectName: untyped) =\n" &
    "  type ObjectName* = distinct pointer"
proc genApiVersion*(typeDef: XmlNode): string =
    "template apiVersion*(): untyped = makeVersion(1, 0, 0)"
proc genApiVersion10*(typeDef: XmlNode): string =
    "template apiVersion10*(): untyped = makeVersion(1, 0, 0)"
proc genApiVersion11*(typeDef: XmlNode): string =
    "template apiVersion11*(): untyped = makeVersion(1, 1, 0)"
proc genApiVersion12*(typeDef: XmlNode): string =
    "template apiVersion12*(): untyped = makeVersion(1, 2, 0)"
proc genMakeVersion*(typeDef: XmlNode): string =
    "template makeVersion*(major, minor, patch: uint32): untyped =\n" &
    "  ( (major shl 22) or (minor shl 12) or patch )"
proc genVersionMajor*(typeDef: XmlNode): string =
    "template versionMajor*(major: uint32): untyped = ( major shl 22 )"
proc genVersionMinor*(typeDef: XmlNode): string =
    "template versionMajor*(minor: uint32): untyped = ( minor shl 12 )"
proc genVersionPatch*(typeDef: XmlNode): string =
    "template versionPatch*(patch: uint32): untyped = ( patch )"
proc genNullHandle*(typeDef: XmlNode): string =
    "template nullHandle*(): untyped = ( cast[pointer](0) )"

let defineComponents* = newTable([
  ("VK_DEFINE_HANDLE", genDefineHandle),
  ("VK_DEFINE_NON_DISPATCHABLE_HANDLE", genDefineNonDispatchableHandle),
  ("VK_MAKE_VERSION", genMakeVersion),
  ("VK_API_VERSION", genApiVersion),
  ("VK_API_VERSION_1_0", genApiVersion10),
  ("VK_API_VERSION_1_1", genApiVersion11),
  ("VK_API_VERSION_1_2", genApiVersion12),
  ("VK_HEADER_VERSION", genVkHeaderVersion),
  ("VK_HEADER_VERSION_COMPLETE", genVkHeaderVersionComplete),
  ("VK_VERSION_MAJOR", genVersionMajor),
  ("VK_VERSION_MINOR", genVersionMinor),
  ("VK_VERSION_PATCH", genVersionPatch),
  ("VK_NULL_HANDLE", genNullHandle),
])