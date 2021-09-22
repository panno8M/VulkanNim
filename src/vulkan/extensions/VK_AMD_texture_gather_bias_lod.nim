# Generated at 2021-09-22T15:02:54Z
# VK_AMD_texture_gather_bias_lod


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  AmdTextureGatherBiasLodSpecVersion* = 1
  AmdTextureGatherBiasLodExtensionName* = "VK_AMD_texture_gather_bias_lod"

type
  TextureLODGatherFormatPropertiesAMD* = object
    sType* {.constant: (StructureType.textureLodGatherFormatPropertiesAmd).}: StructureType
    pNext* {.optional.}: pointer
    supportsTextureGatherLODBiasAMD*: Bool32



