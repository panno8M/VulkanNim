
import ../platform
import ../features/vk10




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


