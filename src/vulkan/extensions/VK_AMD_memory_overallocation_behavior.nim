
import ../platform
import ../features/vk10


const
  AmdMemoryOverallocationBehaviorSpecVersion* = 1
  AmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"

type
  MemoryOverallocationBehaviorAMD* {.size: sizeof(int32), pure.} = enum
    DefaultAmd = 0
    AllowedAmd = 1
    DisallowedAmd = 2
  DeviceMemoryOverallocationCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD


