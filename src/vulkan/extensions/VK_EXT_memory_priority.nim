# Generated at 2021-08-28T12:28:01Z
# VK_EXT_memory_priority
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtMemoryPrioritySpecVersion* = 1
  ExtMemoryPriorityExtensionName* = "VK_EXT_memory_priority"

type
  PhysicalDeviceMemoryPriorityFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    memoryPriority*: Bool32
  MemoryPriorityAllocateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    priority*: float32



