# VK_NV_shader_sm_builtins

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvShaderSmBuiltinsSpecVersion* = 1
  NvShaderSmBuiltinsExtensionName* = "VK_NV_shader_sm_builtins"

type
  PhysicalDeviceShaderSMBuiltinsPropertiesNV* = object
    sType* {.constant: (StructureType.physicalDeviceShaderSmBuiltinsPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    shaderSMCount*: uint32
    shaderWarpsPerSM*: uint32
  PhysicalDeviceShaderSMBuiltinsFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceShaderSmBuiltinsFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    shaderSMBuiltins*: Bool32



