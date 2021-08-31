import xmltree
import strutils
import sequtils
import strformat
import options
import ./utils
func genVkHeaderVersion*(typeDef: XmlNode): Option[string] {.raises: [].} =
  var version: int
  for child in typeDef:
    try:
      version = child.innerText.parseStatement.parseInt
      if version != 0: break
    except ValueError: continue
  try:
    some "template headerVersion*(): untyped = {version}".fmt
  except ValueError:
    none string

func genVkHeaderVersionComplete*(typeDef: XmlNode): Option[string] {.raises: [].} =
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
  try:
    some "template headerVersionComplete*(): untyped =\n" &
         "  makeVersion{args}".fmt
  except ValueError:
    none string
const
  genDefineHandle* =
    "template defineHandle*(ObjectName: untyped) =\n" &
    "  type HtObjectName* = object of HandleType\n" &
    "  type ObjectName* = Handle[Ht`ObjectName`]"
  genDefineNonDispatchableHandle* =
    "template defineNonDispatchableHandle*(ObjectName: untyped) =\n" &
    "  type HtObjectName* = object of HandleType\n" &
    "  type ObjectName* = NonDispatchableHandle[Ht`ObjectName`]"
  genApiVersion* =
    "template apiVersion*(): untyped = makeVersion(1, 0, 0)"
  genApiVersion10* =
    "template apiVersion10*(): untyped = makeVersion(1, 0, 0)"
  genApiVersion11* =
    "template apiVersion11*(): untyped = makeVersion(1, 1, 0)"
  genApiVersion12* =
    "template apiVersion12*(): untyped = makeVersion(1, 2, 0)"
  genMakeVersion* =
    "template makeVersion*(major, minor, patch: uint32): untyped =\n" &
    "  ( (major shl 22) or (minor shl 12) or patch )"
  genVersionMajor* =
    "template versionMajor*(major: uint32): untyped = ( major shl 22 )"
  genVersionMinor* =
    "template versionMajor*(minor: uint32): untyped = ( minor shl 12 )"
  genVersionPatch* =
    "template versionPatch*(patch: uint32): untyped = ( patch )"
  genNullHandle* =
    "template nullHandle*(): untyped = ( cast[NullHandle](0) )"

func define*(id: string; typeDef: XmlNode): Option[string] {.raises: [].} =
  case id
  of "VK_DEFINE_HANDLE": some genDefineHandle
  of "VK_DEFINE_NON_DISPATCHABLE_HANDLE": some genDefineNonDispatchableHandle
  of "VK_MAKE_VERSION": some genMakeVersion
  of "VK_API_VERSION": some genApiVersion
  of "VK_API_VERSION_1_0": some genApiVersion10
  of "VK_API_VERSION_1_1": some genApiVersion11
  of "VK_API_VERSION_1_2": some genApiVersion12
  of "VK_HEADER_VERSION": genVkHeaderVersion(typeDef)
  of "VK_HEADER_VERSION_COMPLETE": genVkHeaderVersionComplete(typeDef)
  of "VK_VERSION_MAJOR": some genVersionMajor
  of "VK_VERSION_MINOR": some genVersionMinor
  of "VK_VERSION_PATCH": some genVersionPatch
  of "VK_NULL_HANDLE": some genNullHandle
  else: none string