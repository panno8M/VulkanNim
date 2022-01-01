# VK_QCOM_fragment_density_map_offset

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_EXT_fragment_density_map
import ../platform
prepareVulkanLibDef()

const
  QcomFragmentDensityMapOffsetSpecVersion* = 1
  QcomFragmentDensityMapOffsetExtensionName* = "VK_QCOM_fragment_density_map_offset"

type
  PhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentDensityMapOffsetFeaturesQcom).}: StructureType
    pNext* {.optional.}: pointer
    fragmentDensityMapOffset*: Bool32
  PhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentDensityMapOffsetPropertiesQcom).}: StructureType
    pNext* {.optional.}: pointer
    fragmentDensityOffsetGranularity*: Extent2D
  SubpassFragmentDensityMapOffsetEndInfoQCOM* = object
    sType* {.constant: (StructureType.subpassFragmentDensityMapOffsetEndInfoQcom).}: StructureType
    pNext* {.optional.}: pointer
    fragmentDensityOffsetCount* {.optional.}: uint32
    pFragmentDensityOffsets* {.length: fragmentDensityOffsetCount.}: arrPtr[Offset2D]



