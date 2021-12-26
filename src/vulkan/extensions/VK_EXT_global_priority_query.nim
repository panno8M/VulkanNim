# Generated at 2021-12-26T16:57:02Z
# VK_EXT_global_priority_query

import ../platform

import ../features/vk10
import ./VK_EXT_global_priority
import ./VK_KHR_get_physical_device_properties2
export VK_EXT_global_priority
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  ExtGlobalPriorityQuerySpecVersion* = 1
  ExtGlobalPriorityQueryExtensionName* = "VK_EXT_global_priority_query"

type
  PhysicalDeviceGlobalPriorityQueryFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceGlobalPriorityQueryFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    globalPriorityQuery*: Bool32
  QueueFamilyGlobalPriorityPropertiesEXT* = object
    sType* {.constant: (StructureType.queueFamilyGlobalPriorityPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    priorityCount*: uint32
    priorities*: array[MaxGlobalPrioritySizeExt, QueueGlobalPriorityEXT]



