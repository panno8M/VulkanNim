# Generated at 2021-09-09T01:49:36Z
# VK_NV_dedicated_allocation


import ../platform
import ../features/vk10

const
  NvDedicatedAllocationSpecVersion* = 1
  NvDedicatedAllocationExtensionName* = "VK_NV_dedicated_allocation"

type
  DedicatedAllocationImageCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    dedicatedAllocation*: Bool32
  DedicatedAllocationBufferCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    dedicatedAllocation*: Bool32
  DedicatedAllocationMemoryAllocateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
    buffer*: Buffer



