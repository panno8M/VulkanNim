
import ../platform
import ../features/vk10


type
  PhysicalDeviceCoherentMemoryFeaturesAMD* = object
    sType*: StructureType
    pNext*: pointer
    deviceCoherentMemory*: Bool32

const AmdDeviceCoherentMemoryExtensionName* = "VK_AMD_device_coherent_memory"
const AmdDeviceCoherentMemorySpecVersion* = 1

