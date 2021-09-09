# Generated at 2021-09-09T01:49:36Z
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
    sType*: StructureType
    pNext*: pointer
    textureCompressionASTC_HDR*: Bool32



