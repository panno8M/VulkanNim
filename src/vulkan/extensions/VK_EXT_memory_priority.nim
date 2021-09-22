# Generated at 2021-09-22T15:02:54Z
# VK_EXT_memory_priority


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtMemoryPrioritySpecVersion* = 1
  ExtMemoryPriorityExtensionName* = "VK_EXT_memory_priority"

type
  PhysicalDeviceMemoryPriorityFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceMemoryPriorityFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    memoryPriority*: Bool32
  MemoryPriorityAllocateInfoEXT* = object
    sType* {.constant: (StructureType.memoryPriorityAllocateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    priority*: float32



