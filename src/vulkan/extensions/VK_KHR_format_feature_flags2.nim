# Generated at 2021-12-26T16:57:01Z
# VK_KHR_format_feature_flags2

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  KhrFormatFeatureFlags2SpecVersion* = 1
  KhrFormatFeatureFlags2ExtensionName* = "VK_KHR_format_feature_flags2"

type
  FormatProperties3KHR* = object
    sType* {.constant: (StructureType.formatProperties3Khr).}: StructureType
    pNext* {.optional.}: pointer
    linearTilingFeatures* {.optional.}: FormatFeatureFlags2KHR
    optimalTilingFeatures* {.optional.}: FormatFeatureFlags2KHR
    bufferFeatures* {.optional.}: FormatFeatureFlags2KHR



