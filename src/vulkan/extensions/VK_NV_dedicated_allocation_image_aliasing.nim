# VK_NV_dedicated_allocation_image_aliasing

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvDedicatedAllocationImageAliasingSpecVersion* = 1
  NvDedicatedAllocationImageAliasingExtensionName* = "VK_NV_dedicated_allocation_image_aliasing"

type
  PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceDedicatedAllocationImageAliasingFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    dedicatedAllocationImageAliasing*: Bool32



