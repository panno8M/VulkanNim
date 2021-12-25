# Generated at 2021-12-25T14:19:30Z
# VK_EXT_ycbcr_image_arrays

import ../platform
import ../features/vk10
import ./VK_KHR_sampler_ycbcr_conversion
export VK_KHR_sampler_ycbcr_conversion

prepareVulkanLibDef()

const
  ExtYcbcrImageArraysSpecVersion* = 1
  ExtYcbcrImageArraysExtensionName* = "VK_EXT_ycbcr_image_arrays"

type
  PhysicalDeviceYcbcrImageArraysFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceYcbcrImageArraysFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    ycbcrImageArrays*: Bool32



