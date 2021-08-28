# Generated at 2021-08-28T12:28:00Z
# VK_EXT_texture_compression_astc_hdr
# ===================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtTextureCompressionAstcHdrSpecVersion* = 1
  ExtTextureCompressionAstcHdrExtensionName* = "VK_EXT_texture_compression_astc_hdr"

type
  PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    textureCompressionASTC_HDR*: Bool32



