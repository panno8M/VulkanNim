# Generated at 2021-12-25T14:19:30Z
# VK_AMD_memory_overallocation_behavior

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  AmdMemoryOverallocationBehaviorSpecVersion* = 1
  AmdMemoryOverallocationBehaviorExtensionName* = "VK_AMD_memory_overallocation_behavior"

type
  DeviceMemoryOverallocationCreateInfoAMD* = object
    sType* {.constant: (StructureType.deviceMemoryOverallocationCreateInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    overallocationBehavior*: MemoryOverallocationBehaviorAMD



