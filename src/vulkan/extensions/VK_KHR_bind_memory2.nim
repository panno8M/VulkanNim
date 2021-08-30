# Generated at 2021-08-30T22:51:48Z
# VK_KHR_bind_memory2


import ../platform
import ../features/vk10

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

