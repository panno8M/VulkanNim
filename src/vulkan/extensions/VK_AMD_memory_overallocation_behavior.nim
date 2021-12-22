# Generated at 2021-12-22T14:50:01Z
# VK_AMD_memory_overallocation_behavior

import ../platform
import ../features/vk10

prepareVulkanLibDef()

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



