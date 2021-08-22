
import ../platform
import ../features/vk10
import VK_KHR_dedicated_allocation


type
  PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    dedicatedAllocationImageAliasing*: Bool32

const NvDedicatedAllocationImageAliasingSpecVersion* = 1
const NvDedicatedAllocationImageAliasingExtensionName* = "VK_NV_dedicated_allocation_image_aliasing"

