# Generated at 2021-09-10T05:27:58Z
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
    sType* {.constant: (StructureType.deviceMemoryOverallocationCreateInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD



