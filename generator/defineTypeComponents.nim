import xmltree
import strutils
import sequtils
import std/strformat
import std/options
import ./utils
func genVkHeaderVersion*(typeDef: XmlNode): Option[string] {.raises: [].} =
  var version: int
  for child in typeDef:
    try:
      version = child.innerText.parseStatement.parseInt
      if version != 0: break
    except ValueError: continue
  try:
    some "template headerVersion*(): untyped = {version}\n".fmt
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
         "  makeApiVersion({args})\n".fmt
  except ValueError:
    none string
const
  defineHandle* = stringify:
    template defineHandle*(ObjectName: untyped): untyped =
      type HtObjectName* = object of HandleType
      type ObjectName* = Handle[Ht`ObjectName`]
  defineNonDispatchableHandle* = stringify:
    template defineNonDispatchableHandle*(ObjectName: untyped): untyped =
      type HtObjectName* = object of HandleType
      type ObjectName* = NonDispatchableHandle[Ht`ObjectName`]
  apiVersion* = stringify:
    template apiVersion*(): untyped {.deprecated.} = makeVersion(1, 0, 0)
  apiVersion10* = stringify:
    template apiVersion10*(): untyped = makeApiVersion(0, 1, 0, 0)
  apiVersion11* = stringify:
    template apiVersion11*(): untyped = makeApiVersion(0, 1, 1, 0)
  apiVersion12* = stringify:
    template apiVersion12*(): untyped = makeApiVersion(0, 1, 2, 0)
  makeVersion* = stringify:
    template makeVersion*(major, minor, patch: uint32): untyped {.deprecated: "makeApiVersion should be used instead.".} =
      uint32( (major shl 22) or (minor shl 12) or patch )
  versionMajor* = stringify:
    template versionMajor*(version: uint32): untyped {.deprecated: "apiVersionMajor should be used instead.".} =
      (uint32(version) shl 22)
  versionMinor* = stringify:
    template versionMinor*(version: uint32): untyped {.deprecated: "apiVersionMinor should be used instead.".} =
      (uint32(version) shl 12) and 0x3ffu
  versionPatch* = stringify:
    template versionPatch*(version: uint32): untyped {.deprecated: "apiVersionPatch should be used instead.".} =
      uint32(version) and 0xfffu
  makeApiVersion* = stringify:
    template makeApiVersion*(variant, major, minor, patch: uint32): untyped =
      uint32( (variant shl 29) or (major shl 22) or (minor shl 12) or patch )
  apiVersionVariant* = stringify:
    template apiVersionVariant*(version: uint32): untyped = uint32(version) shl 29
  apiVersionMajor* = stringify:
    template apiVersionMajor*(version: uint32): untyped = (uint32(version) shl 22) and 0x7fu
  apiVersionMinor* = stringify:
    template apiVersionMinor*(version: uint32): untyped = (uint32(version) shl 12) and 0x3ffu
  apiVersionPatch* = stringify:
    template apiVersionPatch*(version: uint32): untyped = uint32(version) and 0xfffu
  nullHandle* = stringify:
    template nullHandle*(): untyped = ( cast[Handle[HtNil]](0) )

func define*(id: string; typeDef: XmlNode): Option[string] {.raises: [].} =
  case id
  of "VK_MAKE_VERSION": some makeVersion
  of "VK_API_VERSION": some apiVersion
  of "VK_API_VERSION_1_0": some apiVersion10
  of "VK_API_VERSION_1_1": some apiVersion11
  of "VK_API_VERSION_1_2": some apiVersion12
  of "VK_MAKE_API_VERSION": some makeApiVersion
  of "VK_API_VERSION_VARIANT": some apiVersionVariant
  of "VK_API_VERSION_MAJOR": some apiVersionMajor
  of "VK_API_VERSION_MINOR": some apiVersionMinor
  of "VK_API_VERSION_PATCH": some apiVersionPatch
  of "VK_VERSION_MAJOR": some versionMajor
  of "VK_VERSION_MINOR": some versionMinor
  of "VK_VERSION_PATCH": some versionPatch
  of "VK_HEADER_VERSION": genVkHeaderVersion(typeDef)
  of "VK_HEADER_VERSION_COMPLETE": genVkHeaderVersionComplete(typeDef)

  # TODO
  of "VK_DEFINE_HANDLE": some ""
  of "VK_DEFINE_NON_DISPATCHABLE_HANDLE": some ""
  of "VK_NULL_HANDLE": some ""
  of "VK_USE_64_BIT_PTR_DEFINES": some ""

  else: none string