# VK_EXT_astc_decode_mode

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  ExtAstcDecodeModeSpecVersion* = 1
  ExtAstcDecodeModeExtensionName* = "VK_EXT_astc_decode_mode"

type
  ImageViewASTCDecodeModeEXT* = object
    sType* {.constant: (StructureType.imageViewAstcDecodeModeExt).}: StructureType
    pNext* {.optional.}: pointer
    decodeMode*: Format
  PhysicalDeviceASTCDecodeFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceAstcDecodeFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    decodeModeSharedExponent*: Bool32



