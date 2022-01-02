# VK_KHR_shader_terminate_invocation

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrShaderTerminateInvocationSpecVersion* = 1
  KhrShaderTerminateInvocationExtensionName* = "VK_KHR_shader_terminate_invocation"

type
  PhysicalDeviceShaderTerminateInvocationFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderTerminateInvocationFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderTerminateInvocation*: Bool32



