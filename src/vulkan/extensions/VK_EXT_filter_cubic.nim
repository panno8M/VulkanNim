# Generated at 2021-09-22T15:02:54Z
# VK_EXT_filter_cubic


import ../platform
import ../features/vk10

const
  ExtFilterCubicSpecVersion* = 3
  ExtFilterCubicExtensionName* = "VK_EXT_filter_cubic"

type
  PhysicalDeviceImageViewImageFormatInfoEXT* = object
    sType* {.constant: (StructureType.physicalDeviceImageViewImageFormatInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    imageViewType*: ImageViewType
  FilterCubicImageViewImageFormatPropertiesEXT* = object
    sType* {.constant: (StructureType.filterCubicImageViewImageFormatPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    filterCubic*: Bool32
    filterCubicMinmax*: Bool32

FormatFeatureFlagBits.defineAliases:
  sampledImageFilterCubicImg as sampledImageFilterCubicExt

Filter.defineAliases:
  cubicImg as cubicExt


