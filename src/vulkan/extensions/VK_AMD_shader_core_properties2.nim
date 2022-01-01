# VK_AMD_shader_core_properties2

import ../features/vk10
import VK_AMD_shader_core_properties
import ../platform
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



