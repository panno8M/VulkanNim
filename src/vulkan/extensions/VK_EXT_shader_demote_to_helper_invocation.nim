# Generated at 2021-08-31T05:18:46Z
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



