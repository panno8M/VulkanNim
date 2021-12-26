# Generated at 2021-12-26T10:16:14Z
# VK_EXT_global_priority

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  ExtGlobalPrioritySpecVersion* = 2
  ExtGlobalPriorityExtensionName* = "VK_EXT_global_priority"

type
  DeviceQueueGlobalPriorityCreateInfoEXT* = object
    sType* {.constant: (StructureType.deviceQueueGlobalPriorityCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    globalPriority*: QueueGlobalPriorityEXT



