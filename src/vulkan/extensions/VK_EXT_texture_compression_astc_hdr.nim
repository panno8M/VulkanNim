# VK_EXT_texture_compression_astc_hdr

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtTextureCompressionAstcHdrSpecVersion* = 1
  ExtTextureCompressionAstcHdrExtensionName* = "VK_EXT_texture_compression_astc_hdr"

type
  PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceTextureCompressionAstcHdrFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    textureCompressionASTC_HDR*: Bool32



