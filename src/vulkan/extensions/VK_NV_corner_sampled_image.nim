# Generated at 2021-10-24T02:03:03Z
# VK_NV_corner_sampled_image

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  NvCornerSampledImageSpecVersion* = 2
  NvCornerSampledImageExtensionName* = "VK_NV_corner_sampled_image"

type
  PhysicalDeviceCornerSampledImageFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceCornerSampledImageFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    cornerSampledImage*: Bool32



