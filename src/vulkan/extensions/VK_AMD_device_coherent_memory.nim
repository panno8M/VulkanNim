# Generated at 2021-09-22T15:02:54Z
# VK_AMD_device_coherent_memory


import ../platform
import ../features/vk10

const
  AmdDeviceCoherentMemorySpecVersion* = 1
  AmdDeviceCoherentMemoryExtensionName* = "VK_AMD_device_coherent_memory"

type
  PhysicalDeviceCoherentMemoryFeaturesAMD* = object
    sType* {.constant: (StructureType.physicalDeviceCoherentMemoryFeaturesAmd).}: StructureType
    pNext* {.optional.}: pointer
    deviceCoherentMemory*: Bool32



