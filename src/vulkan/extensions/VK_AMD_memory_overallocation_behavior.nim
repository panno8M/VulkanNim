# Generated at 2021-08-31T05:18:45Z
# VK_AMD_memory_overallocation_behavior


import ../platform
import ../features/vk10

const
  AmdMemoryOverallocationBehaviorSpecVersion* = 1
  AmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"

type # enums and bitmasks
  MemoryOverallocationBehaviorAMD* {.size: sizeof(int32), pure.} = enum
    defaultAmd = 0
    allowedAmd = 1
    disallowedAmd = 2

type
  DeviceMemoryOverallocationCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD



