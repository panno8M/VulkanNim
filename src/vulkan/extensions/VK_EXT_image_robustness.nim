
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PhysicalDeviceImageRobustnessFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    robustImageAccess*: Bool32


