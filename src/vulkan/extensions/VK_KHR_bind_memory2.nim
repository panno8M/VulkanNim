# Generated at 2021-08-30T14:31:10Z
# VK_KHR_bind_memory2


import ../platform
import ../features/vk10

const
  KhrBindMemory2SpecVersion* = 1
  KhrBindMemory2ExtensionName* = "VK_KHR_bind_memory2"

type
  BindBufferMemoryInfoKHR* = object
  BindImageMemoryInfoKHR* = object

var # commands
  
  
const bindBufferMemory2KHR* = bindBufferMemory2
const bindImageMemory2KHR* = bindImageMemory2
StructureType.defineAliases:
  bindBufferMemoryInfo as bindBufferMemoryInfoKhr
  bindImageMemoryInfo as bindImageMemoryInfoKhr

ImageCreateFlagBits.defineAliases:
  alias as aliasKhr

proc loadVK_KHR_bind_memory2*(instance: Instance) =
  instance.defineLoader(`<<`)

  bindBufferMemory2KHRCage << "vkBindBufferMemory2KHR"
  bindImageMemory2KHRCage << "vkBindImageMemory2KHR"