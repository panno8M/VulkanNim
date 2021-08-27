
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  NvFragmentShaderBarycentricSpecVersion* = 1
  NvFragmentShaderBarycentricExtensionName* = "VK_NV_fragment_shader_barycentric"

type
  PhysicalDeviceFragmentShaderBarycentricFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    fragmentShaderBarycentric*: Bool32


