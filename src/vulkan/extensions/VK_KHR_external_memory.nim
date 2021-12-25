# Generated at 2021-12-25T14:21:16Z
# VK_KHR_external_memory

import ../platform
import ../features/vk10
import ./VK_KHR_external_memory_capabilities
import ../features/vk11
export VK_KHR_external_memory_capabilities

prepareVulkanLibDef()

const
  KhrExternalMemorySpecVersion* = 1
  KhrExternalMemoryExtensionName* = "VK_KHR_external_memory"

type
  ExternalMemoryImageCreateInfoKHR* = object
  ExternalMemoryBufferCreateInfoKHR* = object
  ExportMemoryAllocateInfoKHR* = object



