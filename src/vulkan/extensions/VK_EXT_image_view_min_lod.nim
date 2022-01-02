# VK_EXT_image_view_min_lod

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtImageViewMinLodSpecVersion* = 1
  ExtImageViewMinLodExtensionName* = "VK_EXT_image_view_min_lod"

type
  PhysicalDeviceImageViewMinLodFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceImageViewMinLodFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    minLod*: Bool32
  ImageViewMinLodCreateInfoEXT* = object
    sType* {.constant: (StructureType.imageViewMinLodCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    minLod*: float32



