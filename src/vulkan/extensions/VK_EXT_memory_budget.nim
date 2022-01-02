# VK_EXT_memory_budget

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtMemoryBudgetSpecVersion* = 1
  ExtMemoryBudgetExtensionName* = "VK_EXT_memory_budget"

type
  PhysicalDeviceMemoryBudgetPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceMemoryBudgetPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    heapBudget*: array[MaxMemoryHeaps, DeviceSize]
    heapUsage*: array[MaxMemoryHeaps, DeviceSize]



