# VK_KHR_external_memory

import ../features/vk10
import VK_KHR_external_memory_capabilities
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrExternalMemorySpecVersion* = 1
  KhrExternalMemoryExtensionName* = "VK_KHR_external_memory"

type
  ExternalMemoryImageCreateInfoKHR* = object
  ExternalMemoryBufferCreateInfoKHR* = object
  ExportMemoryAllocateInfoKHR* = object



