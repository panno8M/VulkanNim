# Generated at 2021-12-26T16:57:01Z
# VK_KHR_shader_terminate_invocation

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  KhrShaderTerminateInvocationSpecVersion* = 1
  KhrShaderTerminateInvocationExtensionName* = "VK_KHR_shader_terminate_invocation"

type
  PhysicalDeviceShaderTerminateInvocationFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderTerminateInvocationFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderTerminateInvocation*: Bool32



