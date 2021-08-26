
import ../platform
import ../features/vk10
import VK_KHR_dedicated_allocation




type
  PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    dedicatedAllocationImageAliasing*: Bool32


