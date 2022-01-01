# VK_EXT_ycbcr_2plane_444_formats

import ../features/vk10
import VK_KHR_sampler_ycbcr_conversion
import ../platform
prepareVulkanLibDef()

const
  ExtYcbcr2plane444FormatsSpecVersion* = 1
  ExtYcbcr2plane444FormatsExtensionName* = "VK_EXT_ycbcr_2plane_444_formats"

type
  PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceYcbcr2Plane444FormatsFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    ycbcr2plane444Formats*: Bool32



