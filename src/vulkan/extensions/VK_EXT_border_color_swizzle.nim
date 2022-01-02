# VK_EXT_border_color_swizzle

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtBorderColorSwizzleSpecVersion* = 1
  ExtBorderColorSwizzleExtensionName* = "VK_EXT_border_color_swizzle"

type
  PhysicalDeviceBorderColorSwizzleFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceBorderColorSwizzleFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    borderColorSwizzle*: Bool32
    borderColorSwizzleFromImage*: Bool32
  SamplerBorderColorComponentMappingCreateInfoEXT* = object
    sType* {.constant: (StructureType.samplerBorderColorComponentMappingCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    components*: ComponentMapping
    srgb*: Bool32



