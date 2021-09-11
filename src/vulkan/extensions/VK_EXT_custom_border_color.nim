# Generated at 2021-09-10T05:27:58Z
# VK_EXT_custom_border_color


import ../platform
import ../features/vk10

const
  ExtCustomBorderColorSpecVersion* = 12
  ExtCustomBorderColorExtensionName* = "VK_EXT_custom_border_color"

type
  SamplerCustomBorderColorCreateInfoEXT* = object
    sType* {.constant: (StructureType.samplerCustomBorderColorCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    customBorderColor*: ClearColorValue
    format*: Format
  PhysicalDeviceCustomBorderColorPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceCustomBorderColorPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxCustomBorderColorSamplers*: uint32
  PhysicalDeviceCustomBorderColorFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceCustomBorderColorFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    customBorderColors*: Bool32
    customBorderColorWithoutFormat*: Bool32



