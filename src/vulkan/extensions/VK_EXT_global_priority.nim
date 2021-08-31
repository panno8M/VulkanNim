# Generated at 2021-08-31T05:18:45Z
# VK_EXT_global_priority


import ../platform
import ../features/vk10

const
  ExtGlobalPrioritySpecVersion* = 2
  ExtGlobalPriorityExtensionName* = "VK_EXT_global_priority"

type # enums and bitmasks
  QueueGlobalPriorityEXT* {.size: sizeof(int32), pure.} = enum
    lowExt = 128
    mediumExt = 256
    highExt = 512
    realtimeExt = 1024

type
  DeviceQueueGlobalPriorityCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    globalPriority*: QueueGlobalPriorityEXT



