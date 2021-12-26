# Generated at 2021-12-26T10:16:14Z
# VK_AMD_device_coherent_memory

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  AmdDeviceCoherentMemorySpecVersion* = 1
  AmdDeviceCoherentMemoryExtensionName* = "VK_AMD_device_coherent_memory"

type
  PhysicalDeviceCoherentMemoryFeaturesAMD* = object
    sType* {.constant: (StructureType.physicalDeviceCoherentMemoryFeaturesAmd).}: StructureType
    pNext* {.optional.}: pointer
    deviceCoherentMemory*: Bool32



