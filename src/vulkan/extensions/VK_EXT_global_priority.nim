# Generated at 2021-08-28T12:28:01Z
# VK_EXT_global_priority
# =================================

import ../platform
import ../features/vk10


const
  ExtGlobalPrioritySpecVersion* = 2
  ExtGlobalPriorityExtensionName* = "VK_EXT_global_priority"

type
  DeviceQueueGlobalPriorityCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    globalPriority*: QueueGlobalPriorityEXT
  QueueGlobalPriorityEXT* {.size: sizeof(int32), pure.} = enum
    lowExt = 128
    mediumExt = 256
    highExt = 512
    realtimeExt = 1024



