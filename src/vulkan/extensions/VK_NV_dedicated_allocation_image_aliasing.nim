# Generated at 2021-08-30T14:31:10Z
# VK_NV_dedicated_allocation_image_aliasing


import ../platform
import ../features/vk10
import ./VK_KHR_dedicated_allocation

const
  NvDedicatedAllocationImageAliasingSpecVersion* = 1
  NvDedicatedAllocationImageAliasingExtensionName* = "VK_NV_dedicated_allocation_image_aliasing"

type
  PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    dedicatedAllocationImageAliasing*: Bool32


