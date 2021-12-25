# Generated at 2021-12-25T07:50:19Z
# VK_EXT_texture_compression_astc_hdr

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  ExtTextureCompressionAstcHdrSpecVersion* = 1
  ExtTextureCompressionAstcHdrExtensionName* = "VK_EXT_texture_compression_astc_hdr"

type
  PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceTextureCompressionAstcHdrFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    textureCompressionASTC_HDR*: Bool32



