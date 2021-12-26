# Generated at 2021-12-26T16:57:01Z
# VK_EXT_rgba10x6_formats

import ../platform

import ../features/vk10
import ./VK_KHR_sampler_ycbcr_conversion
export VK_KHR_sampler_ycbcr_conversion
prepareVulkanLibDef()

const
  ExtRgba10x6FormatsSpecVersion* = 1
  ExtRgba10x6FormatsExtensionName* = "VK_EXT_rgba10x6_formats"

type
  PhysicalDeviceRGBA10X6FormatsFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceRgba10x6FormatsFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    formatRgba10x6WithoutYCbCrSampler*: Bool32



