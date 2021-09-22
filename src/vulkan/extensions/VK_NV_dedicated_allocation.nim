# Generated at 2021-09-22T15:02:54Z
# VK_NV_dedicated_allocation


import ../platform
import ../features/vk10

const
  NvDedicatedAllocationSpecVersion* = 1
  NvDedicatedAllocationExtensionName* = "VK_NV_dedicated_allocation"

type
  DedicatedAllocationImageCreateInfoNV* = object
    sType* {.constant: (StructureType.dedicatedAllocationImageCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    dedicatedAllocation*: Bool32
  DedicatedAllocationBufferCreateInfoNV* = object
    sType* {.constant: (StructureType.dedicatedAllocationBufferCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    dedicatedAllocation*: Bool32
  DedicatedAllocationMemoryAllocateInfoNV* = object
    sType* {.constant: (StructureType.dedicatedAllocationMemoryAllocateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    image* {.optional.}: Image
    buffer* {.optional.}: Buffer



