# Generated at 2021-08-27T06:01:02Z
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
proc loadVK_KHR_get_memory_requirements2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getImageMemoryRequirements2KHRCage << "vkGetImageMemoryRequirements2KHR"
  getBufferMemoryRequirements2KHRCage << "vkGetBufferMemoryRequirements2KHR"
  getImageSparseMemoryRequirements2KHRCage << "vkGetImageSparseMemoryRequirements2KHR"