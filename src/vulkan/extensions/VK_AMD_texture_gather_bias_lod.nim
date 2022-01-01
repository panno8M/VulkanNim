# VK_AMD_texture_gather_bias_lod

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  AmdTextureGatherBiasLodSpecVersion* = 1
  AmdTextureGatherBiasLodExtensionName* = "VK_AMD_texture_gather_bias_lod"

type
  TextureLODGatherFormatPropertiesAMD* = object
    sType* {.constant: (StructureType.textureLodGatherFormatPropertiesAmd).}: StructureType
    pNext* {.optional.}: pointer
    supportsTextureGatherLODBiasAMD*: Bool32



