# Generated at 2021-08-30T22:51:48Z
# VK_KHR_get_memory_requirements2


import ../platform
import ../features/vk10

const
  KhrGetMemoryRequirements2SpecVersion* = 1
  KhrGetMemoryRequirements2ExtensionName* = "VK_KHR_get_memory_requirements2"

type
  BufferMemoryRequirementsInfo2KHR* = object
  ImageMemoryRequirementsInfo2KHR* = object
  ImageSparseMemoryRequirementsInfo2KHR* = object
  MemoryRequirements2KHR* = object
  SparseImageMemoryRequirements2KHR* = object

const getImageMemoryRequirements2KHR* = getImageMemoryRequirements2
const getBufferMemoryRequirements2KHR* = getBufferMemoryRequirements2
const getImageSparseMemoryRequirements2KHR* = getImageSparseMemoryRequirements2
StructureType.defineAliases:
  bufferMemoryRequirementsInfo2 as bufferMemoryRequirementsInfo2Khr
  imageMemoryRequirementsInfo2 as imageMemoryRequirementsInfo2Khr
  imageSparseMemoryRequirementsInfo2 as imageSparseMemoryRequirementsInfo2Khr
  memoryRequirements2 as memoryRequirements2Khr
  sparseImageMemoryRequirements2 as sparseImageMemoryRequirements2Khr

