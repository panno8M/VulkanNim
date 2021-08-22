
import ../platform
import ../features/vk10


type
  ImageSparseMemoryRequirementsInfo2KHR* = object
  SparseImageMemoryRequirements2KHR* = object
  BufferMemoryRequirementsInfo2KHR* = object
  MemoryRequirements2KHR* = object
  ImageMemoryRequirementsInfo2KHR* = object

const KhrGetMemoryRequirements2SpecVersion* = 1
const KhrGetMemoryRequirements2ExtensionName* = "VK_KHR_get_memory_requirements2"
var # commands
  
  
  

const getImageSparseMemoryRequirements2KHR* = getImageSparseMemoryRequirements2

const getImageMemoryRequirements2KHR* = getImageMemoryRequirements2

const getBufferMemoryRequirements2KHR* = getBufferMemoryRequirements2


proc loadVK_KHR_get_memory_requirements2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getImageSparseMemoryRequirements2KHRCage << "vkGetImageSparseMemoryRequirements2KHR"
  getImageMemoryRequirements2KHRCage << "vkGetImageMemoryRequirements2KHR"
  getBufferMemoryRequirements2KHRCage << "vkGetBufferMemoryRequirements2KHR"