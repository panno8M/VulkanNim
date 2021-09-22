# Generated at 2021-09-22T15:02:54Z
# VK_EXT_ycbcr_image_arrays


import ../platform
import ../features/vk10
import ./VK_KHR_sampler_ycbcr_conversion
export VK_KHR_sampler_ycbcr_conversion

const
  ExtYcbcrImageArraysSpecVersion* = 1
  ExtYcbcrImageArraysExtensionName* = "VK_EXT_ycbcr_image_arrays"

type
  PhysicalDeviceYcbcrImageArraysFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceYcbcrImageArraysFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    ycbcrImageArrays*: Bool32



