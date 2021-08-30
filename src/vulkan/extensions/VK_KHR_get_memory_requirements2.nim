# Generated at 2021-08-30T22:41:37Z
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

proc loadVK_KHR_get_memory_requirements2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getImageMemoryRequirements2KHRCage << "vkGetImageMemoryRequirements2KHR"
  getBufferMemoryRequirements2KHRCage << "vkGetBufferMemoryRequirements2KHR"
  getImageSparseMemoryRequirements2KHRCage << "vkGetImageSparseMemoryRequirements2KHR"