# Generated at 2021-08-28T12:28:00Z
# VK_AMD_texture_gather_bias_lod
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  AmdTextureGatherBiasLodSpecVersion* = 1
  AmdTextureGatherBiasLodExtensionName* = "VK_AMD_texture_gather_bias_lod"

type
  TextureLODGatherFormatPropertiesAMD* = object
    sType*: StructureType
    pNext*: pointer
    supportsTextureGatherLODBiasAMD*: Bool32



