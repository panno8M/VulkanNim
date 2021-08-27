# Generated at 2021-08-27T06:01:02Z
# VK_EXT_astc_decode_mode
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtAstcDecodeModeSpecVersion* = 1
  ExtAstcDecodeModeExtensionName* = "VK_EXT_astc_decode_mode"

type
  ImageViewASTCDecodeModeEXT* = object
    sType*: StructureType
    pNext*: pointer
    decodeMode*: Format
  PhysicalDeviceASTCDecodeFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    decodeModeSharedExponent*: Bool32


