# Generated at 2021-08-28T00:52:26Z
# VK_KHR_dedicated_allocation
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_memory_requirements2


const
  KhrDedicatedAllocationSpecVersion* = 3
  KhrDedicatedAllocationExtensionName* = "VK_KHR_dedicated_allocation"

type
  MemoryDedicatedRequirementsKHR* = object
  MemoryDedicatedAllocateInfoKHR* = object

StructureType.defineAliases:
  MemoryDedicatedRequirements as MemoryDedicatedRequirementsKhr
  MemoryDedicatedAllocateInfo as MemoryDedicatedAllocateInfoKhr

