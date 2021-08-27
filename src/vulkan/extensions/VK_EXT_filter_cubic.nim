
import ../platform
import ../features/vk10


const
  ExtFilterCubicSpecVersion* = 3
  ExtFilterCubicExtensionName* = "VK_EXT_filter_cubic"

type
  PhysicalDeviceImageViewImageFormatInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    imageViewType*: ImageViewType
  FilterCubicImageViewImageFormatPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    filterCubic*: Bool32
    filterCubicMinmax*: Bool32


