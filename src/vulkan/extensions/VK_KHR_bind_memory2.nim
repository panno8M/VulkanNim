# Generated at 2021-09-09T01:49:36Z
# VK_KHR_bind_memory2


import ../platform
import ../features/vk10
import ../features/vk11

const
  KhrBindMemory2SpecVersion* = 1
  KhrBindMemory2ExtensionName* = "VK_KHR_bind_memory2"

type
  BindBufferMemoryInfoKHR* = object
  BindImageMemoryInfoKHR* = object

const bindBufferMemory2KHR* = bindBufferMemory2
const bindImageMemory2KHR* = bindImageMemory2
StructureType.defineAliases:
  bindBufferMemoryInfo as bindBufferMemoryInfoKhr
  bindImageMemoryInfo as bindImageMemoryInfoKhr

ImageCreateFlagBits.defineAliases:
  alias as aliasKhr


