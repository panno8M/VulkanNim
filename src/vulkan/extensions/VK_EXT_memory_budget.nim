# Generated at 2021-08-31T05:18:46Z
# VK_EXT_memory_budget


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtMemoryBudgetSpecVersion* = 1
  ExtMemoryBudgetExtensionName* = "VK_EXT_memory_budget"
  MaxMemoryHeaps* = 16 # The maximum number of unique memory heaps, each of which supporting 1 or more memory types

type
  PhysicalDeviceMemoryBudgetPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    heapBudget*: array[MaxMemoryHeaps, DeviceSize]
    heapUsage*: array[MaxMemoryHeaps, DeviceSize]



