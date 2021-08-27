# Generated at 2021-08-27T06:01:03Z
# VK_AMD_device_coherent_memory
# =================================

import ../platform
import ../features/vk10


const
  AmdDeviceCoherentMemorySpecVersion* = 1
  AmdDeviceCoherentMemoryExtensionName* = "VK_AMD_device_coherent_memory"

type
  PhysicalDeviceCoherentMemoryFeaturesAMD* = object
    sType*: StructureType
    pNext*: pointer
    deviceCoherentMemory*: Bool32


