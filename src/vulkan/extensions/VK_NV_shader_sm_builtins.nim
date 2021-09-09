# Generated at 2021-09-09T01:49:36Z
# VK_NV_shader_sm_builtins


import ../platform
import ../features/vk10

const
  NvShaderSmBuiltinsSpecVersion* = 1
  NvShaderSmBuiltinsExtensionName* = "VK_NV_shader_sm_builtins"

type
  PhysicalDeviceShaderSMBuiltinsPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    shaderSMCount*: uint32
    shaderWarpsPerSM*: uint32
  PhysicalDeviceShaderSMBuiltinsFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    shaderSMBuiltins*: Bool32



