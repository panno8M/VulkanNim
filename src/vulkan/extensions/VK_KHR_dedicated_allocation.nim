# Generated at 2021-08-31T05:18:45Z
# VK_KHR_dedicated_allocation


import ../platform
import ../features/vk10
import ./VK_KHR_get_memory_requirements2
import ../features/vk11
export VK_KHR_get_memory_requirements2

const
  KhrDedicatedAllocationSpecVersion* = 3
  KhrDedicatedAllocationExtensionName* = "VK_KHR_dedicated_allocation"

type
  MemoryDedicatedRequirementsKHR* = object
  MemoryDedicatedAllocateInfoKHR* = object

StructureType.defineAliases:
  memoryDedicatedRequirements as memoryDedicatedRequirementsKhr
  memoryDedicatedAllocateInfo as memoryDedicatedAllocateInfoKhr


