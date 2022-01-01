# VK_EXT_shader_demote_to_helper_invocation

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  ExtShaderDemoteToHelperInvocationSpecVersion* = 1
  ExtShaderDemoteToHelperInvocationExtensionName* = "VK_EXT_shader_demote_to_helper_invocation"

type
  PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceShaderDemoteToHelperInvocationFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    shaderDemoteToHelperInvocation*: Bool32



