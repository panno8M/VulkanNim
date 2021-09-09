# Generated at 2021-09-09T01:49:36Z
# VK_EXT_shader_demote_to_helper_invocation


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtShaderDemoteToHelperInvocationSpecVersion* = 1
  ExtShaderDemoteToHelperInvocationExtensionName* = "VK_EXT_shader_demote_to_helper_invocation"

type
  PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    shaderDemoteToHelperInvocation*: Bool32



