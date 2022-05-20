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
    some "template headerVersion*(): uint32 = {version}\n".fmt
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
    some "template headerVersionComplete*(): ApiVersion =\n" &
         "  makeApiVersion({args})\n".fmt
  except ValueError:
    none string
const
  makeApiVersion* = stringify:
    template makeApiVersion*(variant, major, minor, patch: uint32): ApiVersion =
      ApiVersion( (variant shl 29) or (major shl 22) or (minor shl 12) or patch )
  apiVersion10* = stringify:
    template apiVersion10*(): ApiVersion = makeApiVersion(0, 1, 0, 0)
  apiVersion11* = stringify:
    template apiVersion11*(): ApiVersion = makeApiVersion(0, 1, 1, 0)
  apiVersion12* = stringify:
    template apiVersion12*(): ApiVersion = makeApiVersion(0, 1, 2, 0)

  apiVersionVariant* = stringify:
    template apiVersionVariant*(version: ApiVersion): uint32 = uint32(version) shr 29
    template variant*(version: ApiVersion): uint32 = apiVersionVariant(version)
  apiVersionMajor* = stringify:
    template apiVersionMajor*(version: ApiVersion): uint32 = (uint32(version) shr 22) and 0x7f'u32
    template major*(version: ApiVersion): uint32 = apiVersionMajor(version)
  apiVersionMinor* = stringify:
    template apiVersionMinor*(version: ApiVersion): uint32 = (uint32(version) shr 12) and 0x3ff'u32
    template minor*(version: ApiVersion): uint32 = apiVersionMinor(version)
  apiVersionPatch* = stringify:
    template apiVersionPatch*(version: ApiVersion): uint32 = uint32(version) and 0xfff'u32
    template patch*(version: ApiVersion): uint32 = apiVersionPatch(version)

func define*(id: string; typeDef: XmlNode): Option[string] {.raises: [].} =
  case id
  of "VK_API_VERSION_1_0": some apiVersion10
  of "VK_API_VERSION_1_1": some apiVersion11
  of "VK_API_VERSION_1_2": some apiVersion12
  of "VK_MAKE_API_VERSION": some makeApiVersion
  of "VK_API_VERSION_VARIANT": some apiVersionVariant
  of "VK_API_VERSION_MAJOR": some apiVersionMajor
  of "VK_API_VERSION_MINOR": some apiVersionMinor
  of "VK_API_VERSION_PATCH": some apiVersionPatch
  of "VK_HEADER_VERSION": genVkHeaderVersion(typeDef)
  of "VK_HEADER_VERSION_COMPLETE": genVkHeaderVersionComplete(typeDef)

# DEPRECATED:
  of "VK_MAKE_VERSION" : some ""
  of "VK_API_VERSION"  : some ""
  of "VK_VERSION_MAJOR": some ""
  of "VK_VERSION_MINOR": some ""
  of "VK_VERSION_PATCH": some ""

  # TODO
  of "VK_DEFINE_HANDLE"                 : some ""
  of "VK_DEFINE_NON_DISPATCHABLE_HANDLE": some ""
  of "VK_NULL_HANDLE"                   : some ""
  of "VK_USE_64_BIT_PTR_DEFINES"        : some ""

  else: none string