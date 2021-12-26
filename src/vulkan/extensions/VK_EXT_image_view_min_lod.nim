# Generated at 2021-12-26T16:57:02Z
# VK_EXT_image_view_min_lod

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
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



