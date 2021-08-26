
import ../platform
import ../features/vk10




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