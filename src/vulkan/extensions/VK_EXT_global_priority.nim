
import ../platform
import ../features/vk10


type
  DeviceQueueGlobalPriorityCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    globalPriority*: QueueGlobalPriorityEXT
  QueueGlobalPriorityEXT* {.size: sizeof(int32), pure.} = enum
    Low = 128
    Medium = 256
    High = 512
    Realtime = 1024

const ExtGlobalPrioritySpecVersion* = 2
const ExtGlobalPriorityExtensionName* = "VK_EXT_global_priority"

