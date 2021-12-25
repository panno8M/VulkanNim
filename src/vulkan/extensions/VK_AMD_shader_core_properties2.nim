# Generated at 2021-12-25T07:50:19Z
# VK_AMD_shader_core_properties2

import ../platform
import ../features/vk10
import ./VK_AMD_shader_core_properties
export VK_AMD_shader_core_properties

prepareVulkanLibDef()

const
  AmdShaderCoreProperties2SpecVersion* = 1
  AmdShaderCoreProperties2ExtensionName* = "VK_AMD_shader_core_properties2"

type
  PhysicalDeviceShaderCoreProperties2AMD* = object
    sType* {.constant: (StructureType.physicalDeviceShaderCoreProperties2Amd).}: StructureType
    pNext* {.optional.}: pointer
    shaderCoreFeatures*: ShaderCorePropertiesFlagsAMD
    activeComputeUnitCount*: uint32



