
import ../platform
import ../features/vk10
import VK_AMD_shader_core_properties


type
  ShaderCorePropertiesFlagBitsAMD* = UnusedEnum
  ShaderCorePropertiesFlagsAMD* = distinct Flags
  PhysicalDeviceShaderCoreProperties2AMD* = object
    sType*: StructureType
    pNext*: pointer
    shaderCoreFeatures*: ShaderCorePropertiesFlagsAMD
    activeComputeUnitCount*: uint32

const AmdShaderCoreProperties2SpecVersion* = 1
const AmdShaderCoreProperties2ExtensionName* = "VK_AMD_shader_core_properties2"

