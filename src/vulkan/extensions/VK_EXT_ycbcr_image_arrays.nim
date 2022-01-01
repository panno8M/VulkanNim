# VK_EXT_ycbcr_image_arrays

import ../features/vk10
import VK_KHR_sampler_ycbcr_conversion
import ../platform
prepareVulkanLibDef()

const
  ExtYcbcrImageArraysSpecVersion* = 1
  ExtYcbcrImageArraysExtensionName* = "VK_EXT_ycbcr_image_arrays"

type
  PhysicalDeviceYcbcrImageArraysFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceYcbcrImageArraysFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    ycbcrImageArrays*: Bool32



