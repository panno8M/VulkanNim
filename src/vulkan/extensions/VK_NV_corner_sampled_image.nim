# Generated at 2021-09-22T15:02:54Z
# VK_NV_corner_sampled_image


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvCornerSampledImageSpecVersion* = 2
  NvCornerSampledImageExtensionName* = "VK_NV_corner_sampled_image"

type
  PhysicalDeviceCornerSampledImageFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceCornerSampledImageFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    cornerSampledImage*: Bool32



