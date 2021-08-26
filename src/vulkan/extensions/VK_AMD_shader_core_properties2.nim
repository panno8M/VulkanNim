
import ../platform
import ../features/vk10
import VK_AMD_shader_core_properties




type
  PhysicalDeviceShaderCoreProperties2AMD* = object
    sType*: StructureType
    pNext*: pointer
    shaderCoreFeatures*: ShaderCorePropertiesFlagsAMD
    activeComputeUnitCount*: uint32
  ShaderCorePropertiesFlagBitsAMD* = UnusedEnum
  ShaderCorePropertiesFlagsAMD* = distinct Flags


