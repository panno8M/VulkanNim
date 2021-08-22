
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    shaderDemoteToHelperInvocation*: Bool32

const ExtShaderDemoteToHelperInvocationSpecVersion* = 1
const ExtShaderDemoteToHelperInvocationExtensionName* = "VK_EXT_shader_demote_to_helper_invocation"

