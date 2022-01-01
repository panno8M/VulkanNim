# VK_KHR_bind_memory2

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrBindMemory2SpecVersion* = 1
  KhrBindMemory2ExtensionName* = "VK_KHR_bind_memory2"

type
  BindBufferMemoryInfoKHR* = object
  BindImageMemoryInfoKHR* = object

const bindBufferMemory2KHR* = bindBufferMemory2
const bindImageMemory2KHR* = bindImageMemory2

