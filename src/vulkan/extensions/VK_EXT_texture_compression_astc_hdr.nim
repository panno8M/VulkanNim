# Generated at 2021-09-10T05:27:58Z
# VK_EXT_texture_compression_astc_hdr


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtTextureCompressionAstcHdrSpecVersion* = 1
  ExtTextureCompressionAstcHdrExtensionName* = "VK_EXT_texture_compression_astc_hdr"

type
  PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceTextureCompressionAstcHdrFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    textureCompressionASTC_HDR*: Bool32



