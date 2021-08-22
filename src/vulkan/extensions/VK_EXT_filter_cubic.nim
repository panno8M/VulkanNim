
import ../platform
import ../features/vk10


type
  FilterCubicImageViewImageFormatPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    filterCubic*: Bool32
    filterCubicMinmax*: Bool32
  PhysicalDeviceImageViewImageFormatInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    imageViewType*: ImageViewType

const ExtFilterCubicSpecVersion* = 3
const ExtFilterCubicExtensionName* = "VK_EXT_filter_cubic"

