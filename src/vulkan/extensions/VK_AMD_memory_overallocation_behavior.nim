# VK_AMD_memory_overallocation_behavior

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  AmdMemoryOverallocationBehaviorSpecVersion* = 1
  AmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"

type
  DeviceMemoryOverallocationCreateInfoAMD* = object
    sType* {.constant: (StructureType.deviceMemoryOverallocationCreateInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD



