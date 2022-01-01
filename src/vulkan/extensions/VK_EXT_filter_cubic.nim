# VK_EXT_filter_cubic

import ../features/vk10
import ../platform
prepareVulkanLibDef()

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



