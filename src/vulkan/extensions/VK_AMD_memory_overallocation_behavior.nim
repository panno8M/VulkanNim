# Generated at 2021-12-26T10:16:14Z
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



