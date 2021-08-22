
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    textureCompressionASTC_HDR*: Bool32

const ExtTextureCompressionAstcHdrSpecVersion* = 1
const ExtTextureCompressionAstcHdrExtensionName* = "VK_EXT_texture_compression_astc_hdr"

