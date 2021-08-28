# Generated at 2021-08-28T00:52:26Z
# VK_KHR_bind_memory2
# =================================

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
  BindBufferMemoryInfo as BindBufferMemoryInfoKhr
  BindImageMemoryInfo as BindImageMemoryInfoKhr

ImageCreateFlagBits.defineAliases:
  Alias as AliasBitKhr

proc loadVK_KHR_bind_memory2*(instance: Instance) =
  instance.defineLoader(`<<`)

  bindBufferMemory2KHRCage << "vkBindBufferMemory2KHR"
  bindImageMemory2KHRCage << "vkBindImageMemory2KHR"