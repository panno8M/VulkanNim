# Generated at 2021-08-28T00:52:26Z
# VK_KHR_get_memory_requirements2
# =================================

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

var # commands
  
  
  
const getImageMemoryRequirements2KHR* = getImageMemoryRequirements2
const getBufferMemoryRequirements2KHR* = getBufferMemoryRequirements2
const getImageSparseMemoryRequirements2KHR* = getImageSparseMemoryRequirements2
StructureType.defineAliases:
  BufferMemoryRequirementsInfo2 as BufferMemoryRequirementsInfo2Khr
  ImageMemoryRequirementsInfo2 as ImageMemoryRequirementsInfo2Khr
  ImageSparseMemoryRequirementsInfo2 as ImageSparseMemoryRequirementsInfo2Khr
  MemoryRequirements2 as MemoryRequirements2Khr
  SparseImageMemoryRequirements2 as SparseImageMemoryRequirements2Khr

proc loadVK_KHR_get_memory_requirements2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getImageMemoryRequirements2KHRCage << "vkGetImageMemoryRequirements2KHR"
  getBufferMemoryRequirements2KHRCage << "vkGetBufferMemoryRequirements2KHR"
  getImageSparseMemoryRequirements2KHRCage << "vkGetImageSparseMemoryRequirements2KHR"