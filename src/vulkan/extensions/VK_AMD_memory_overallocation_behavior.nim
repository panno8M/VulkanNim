
import ../platform
import ../features/vk10




type
  MemoryOverallocationBehaviorAMD* {.size: sizeof(int32), pure.} = enum
    DefaultAmd = 0
    AllowedAmd = 1
    DisallowedAmd = 2
  DeviceMemoryOverallocationCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD


