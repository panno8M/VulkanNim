
import ../platform
import ../features/vk10


type
  BindBufferMemoryInfoKHR* = object
  BindImageMemoryInfoKHR* = object

const KhrBindMemory2SpecVersion* = 1
const KhrBindMemory2ExtensionName* = "VK_KHR_bind_memory2"
var # commands
  
  

const bindBufferMemory2KHR* = bindBufferMemory2

const bindImageMemory2KHR* = bindImageMemory2


proc loadVK_KHR_bind_memory2*(instance: Instance) =
  instance.defineLoader(`<<`)

  bindBufferMemory2KHRCage << "vkBindBufferMemory2KHR"
  bindImageMemory2KHRCage << "vkBindImageMemory2KHR"