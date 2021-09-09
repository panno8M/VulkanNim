# Generated at 2021-09-09T01:49:36Z
# VK_AMD_shader_core_properties2


import ../platform
import ../features/vk10
import ./VK_AMD_shader_core_properties
export VK_AMD_shader_core_properties

const
  AmdShaderCoreProperties2SpecVersion* = 1
  AmdShaderCoreProperties2ExtensionName* = "VK_AMD_shader_core_properties2"

type # enums and bitmasks
  ShaderCorePropertiesFlagBitsAMD* = distinct UnusedEnum
  ShaderCorePropertiesFlagsAMD* = Flags[ShaderCorePropertiesFlagBitsAMD]

type
  PhysicalDeviceShaderCoreProperties2AMD* = object
    sType*: StructureType
    pNext*: pointer
    shaderCoreFeatures*: ShaderCorePropertiesFlagsAMD
    activeComputeUnitCount*: uint32



