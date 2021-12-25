# Generated at 2021-10-24T02:03:04Z
# VK_EXT_shader_demote_to_helper_invocation

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  ExtShaderDemoteToHelperInvocationSpecVersion* = 1
  ExtShaderDemoteToHelperInvocationExtensionName* = "VK_EXT_shader_demote_to_helper_invocation"

type
  PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceShaderDemoteToHelperInvocationFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    shaderDemoteToHelperInvocation*: Bool32



