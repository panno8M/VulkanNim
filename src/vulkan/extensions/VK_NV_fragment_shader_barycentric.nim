
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PhysicalDeviceFragmentShaderBarycentricFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    fragmentShaderBarycentric*: Bool32


