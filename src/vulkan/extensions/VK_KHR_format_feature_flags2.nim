# VK_KHR_format_feature_flags2

import ../features/vk10
import ../platform
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



