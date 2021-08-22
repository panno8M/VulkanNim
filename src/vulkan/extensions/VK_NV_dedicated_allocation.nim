
import ../platform
import ../features/vk10


type
  DedicatedAllocationMemoryAllocateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
    buffer*: Buffer
  DedicatedAllocationImageCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    dedicatedAllocation*: Bool32
  DedicatedAllocationBufferCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    dedicatedAllocation*: Bool32

const NvDedicatedAllocationSpecVersion* = 1
const NvDedicatedAllocationExtensionName* = "VK_NV_dedicated_allocation"

