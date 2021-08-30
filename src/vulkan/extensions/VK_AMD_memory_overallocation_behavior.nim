# Generated at 2021-08-30T14:31:10Z
# VK_AMD_memory_overallocation_behavior


import ../platform
import ../features/vk10

const
  AmdMemoryOverallocationBehaviorSpecVersion* = 1
  AmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"

type
  MemoryOverallocationBehaviorAMD* {.size: sizeof(int32), pure.} = enum
    defaultAmd = 0
    allowedAmd = 1
    disallowedAmd = 2
  DeviceMemoryOverallocationCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD


