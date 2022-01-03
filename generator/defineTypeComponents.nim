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
      args = c.innerText.parseWords({',', '(', ')'})
        .mapIt(it.parseCommandNameFromSnake)
        .mapIt((if not it[^1].isDigit: it & "()" else: it))
        .join(", ")
      break
    if c.kind == xnElement and c.tag == "type":
      isNextOfType = true
  try:
    some "template headerVersionComplete*(): untyped =\n" &
         "  makeApiVersion({args})".fmt
  except ValueError:
    none string
const
  genDefineHandle* =
    "template defineHandle*(ObjectName: untyped): untyped =\n" &
    "  type HtObjectName* = object of HandleType\n" &
    "  type ObjectName* = Handle[Ht`ObjectName`]"
  genDefineNonDispatchableHandle* =
    "template defineNonDispatchableHandle*(ObjectName: untyped): untyped =\n" &
    "  type HtObjectName* = object of HandleType\n" &
    "  type ObjectName* = NonDispatchableHandle[Ht`ObjectName`]"
  genApiVersion* =
    "template apiVersion*(): untyped {.deprecated.} = makeVersion(1, 0, 0)"
  genApiVersion10* =
    "template apiVersion10*(): untyped = makeApiVersion(0, 1, 0, 0)"
  genApiVersion11* =
    "template apiVersion11*(): untyped = makeApiVersion(0, 1, 1, 0)"
  genApiVersion12* =
    "template apiVersion12*(): untyped = makeApiVersion(0, 1, 2, 0)"
  genMakeVersion* =
    "template makeVersion*(major, minor, patch: uint32): untyped {.deprecated: \"makeApiVersion should be used instead.\".} =\n" &
    "  ( (major shl 22) or (minor shl 12) or patch )"
  genVersionMajor* =
    "template versionMajor*(version: uint32): untyped {.deprecated: \"apiVersionMajor should be used instead.\".} =\n" &
    "  (version shl 22)"
  genVersionMinor* =
    "template versionMajor*(version: uint32): untyped {.deprecated: \"apiVersionMinor should be used instead.\".} = \n" &
    "  (version shl 12) and 0x3ffu"
  genVersionPatch* =
    "template versionPatch*(version: uint32): untyped {.deprecated: \"apiVersionPatch should be used instead.\".} = \n" &
    "  (version) and 0xfffu"
  genMakeApiVersion* =
    "template makeApiVersion*(variant, major, minor, patch: uint32): untyped =\n" &
    "  (variant shl 29) or (major shl 22) or (minor shl 12) or patch"
  genApiVersionVariant* =
    "template apiVersionVariant*(version: uint32): untyped = version shl 29"
  genApiVersionMajor* =
    "template apiVersionMajor*(version: uint32): untyped = (version shl 22) and 0x7fu"
  genApiVersionMinor* =
    "template apiVersionMinor*(version: uint32): untyped = (version shl 12) and 0x3ffu"
  genApiVersionPatch* =
    "template apiVersionPatch*(version: uint32): untyped = (version) and 0xfffu"
  genNullHandle* =
    "template nullHandle*(): untyped = ( cast[Handle[HtNil]](0) )"

func define*(id: string; typeDef: XmlNode): Option[string] {.raises: [].} =
  case id
  of "VK_DEFINE_HANDLE": some genDefineHandle
  of "VK_DEFINE_NON_DISPATCHABLE_HANDLE": some genDefineNonDispatchableHandle
  of "VK_MAKE_VERSION": some genMakeVersion
  of "VK_API_VERSION": some genApiVersion
  of "VK_API_VERSION_1_0": some genApiVersion10
  of "VK_API_VERSION_1_1": some genApiVersion11
  of "VK_API_VERSION_1_2": some genApiVersion12
  of "VK_MAKE_API_VERSION": some genMakeApiVersion
  of "VK_API_VERSION_VARIANT": some genApiVersionVariant
  of "VK_API_VERSION_MAJOR": some genApiVersionMajor
  of "VK_API_VERSION_MINOR": some genApiVersionMinor
  of "VK_API_VERSION_PATCH": some genApiVersionPatch
  of "VK_HEADER_VERSION": genVkHeaderVersion(typeDef)
  of "VK_HEADER_VERSION_COMPLETE": genVkHeaderVersionComplete(typeDef)
  of "VK_VERSION_MAJOR": some genVersionMajor
  of "VK_VERSION_MINOR": some genVersionMinor
  of "VK_VERSION_PATCH": some genVersionPatch
  of "VK_NULL_HANDLE": some genNullHandle

  # TODO
  of "VK_USE_64_BIT_PTR_DEFINES": some ""

  else: none string