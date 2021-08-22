
import ../platform
import ../features/vk10


type
  DeviceMemoryOverallocationCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD
  MemoryOverallocationBehaviorAMD* {.size: sizeof(int32), pure.} = enum
    Default = 0
    Allowed = 1
    Disallowed = 2

const AmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"
const AmdMemoryOverallocationBehaviorSpecVersion* = 1

