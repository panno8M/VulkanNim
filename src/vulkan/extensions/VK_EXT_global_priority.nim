
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
    LowExt = 128
    MediumExt = 256
    HighExt = 512
    RealtimeExt = 1024


