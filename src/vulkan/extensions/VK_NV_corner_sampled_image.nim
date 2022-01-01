# VK_NV_corner_sampled_image

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  NvCornerSampledImageSpecVersion* = 2
  NvCornerSampledImageExtensionName* = "VK_NV_corner_sampled_image"

type
  PhysicalDeviceCornerSampledImageFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceCornerSampledImageFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    cornerSampledImage*: Bool32



