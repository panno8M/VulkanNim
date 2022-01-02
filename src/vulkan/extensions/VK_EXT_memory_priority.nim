# VK_EXT_memory_priority

import ../features/vk10
import ../platform
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



