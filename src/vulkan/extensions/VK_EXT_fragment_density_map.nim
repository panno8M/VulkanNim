# VK_EXT_fragment_density_map

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
import VK_KHR_format_feature_flags2
prepareVulkanLibDef()

const
  ExtFragmentDensityMapSpecVersion* = 2
  ExtFragmentDensityMapExtensionName* = "VK_EXT_fragment_density_map"

type
  PhysicalDeviceFragmentDensityMapFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentDensityMapFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    fragmentDensityMap*: Bool32
    fragmentDensityMapDynamic*: Bool32
    fragmentDensityMapNonSubsampledImages*: Bool32
  PhysicalDeviceFragmentDensityMapPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentDensityMapPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    minFragmentDensityTexelSize*: Extent2D
    maxFragmentDensityTexelSize*: Extent2D
    fragmentDensityInvocations*: Bool32
  RenderPassFragmentDensityMapCreateInfoEXT* = object
    sType* {.constant: (StructureType.renderPassFragmentDensityMapCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    fragmentDensityMapAttachment*: AttachmentReference



