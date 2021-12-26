# Generated at 2021-12-26T10:16:14Z
# VK_EXT_memory_priority

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

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



