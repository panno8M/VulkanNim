
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  TextureLODGatherFormatPropertiesAMD* = object
    sType*: StructureType
    pNext*: pointer
    supportsTextureGatherLODBiasAMD*: Bool32

const AmdTextureGatherBiasLodSpecVersion* = 1
const AmdTextureGatherBiasLodExtensionName* = "VK_AMD_texture_gather_bias_lod"

