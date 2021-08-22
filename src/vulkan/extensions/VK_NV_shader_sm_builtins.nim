
import ../platform
import ../features/vk10


type
  PhysicalDeviceShaderSMBuiltinsFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    shaderSMBuiltins*: Bool32
  PhysicalDeviceShaderSMBuiltinsPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    shaderSMCount*: uint32
    shaderWarpsPerSM*: uint32

const NvShaderSmBuiltinsSpecVersion* = 1
const NvShaderSmBuiltinsExtensionName* = "VK_NV_shader_sm_builtins"

