# VK_KHR_dedicated_allocation

import ../features/vk10
import VK_KHR_get_memory_requirements2
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrDedicatedAllocationSpecVersion* = 3
  KhrDedicatedAllocationExtensionName* = "VK_KHR_dedicated_allocation"

type
  MemoryDedicatedRequirementsKHR* = object
  MemoryDedicatedAllocateInfoKHR* = object



