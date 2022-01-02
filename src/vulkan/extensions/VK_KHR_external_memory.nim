# VK_KHR_external_memory

import ../features/vk10
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



