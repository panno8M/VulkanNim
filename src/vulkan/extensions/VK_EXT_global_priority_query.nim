# VK_EXT_global_priority_query

import ../features/vk10
import ../platform
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



