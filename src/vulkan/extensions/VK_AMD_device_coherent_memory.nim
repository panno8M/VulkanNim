# VK_AMD_device_coherent_memory

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  AmdDeviceCoherentMemorySpecVersion* = 1
  AmdDeviceCoherentMemoryExtensionName* = "VK_AMD_device_coherent_memory"

type
  PhysicalDeviceCoherentMemoryFeaturesAMD* = object
    sType* {.constant: (StructureType.physicalDeviceCoherentMemoryFeaturesAmd).}: StructureType
    pNext* {.optional.}: pointer
    deviceCoherentMemory*: Bool32



