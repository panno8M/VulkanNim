# Generated at 2021-08-30T14:31:10Z
# VK_EXT_custom_border_color


import ../platform
import ../features/vk10

const
  ExtCustomBorderColorSpecVersion* = 12
  ExtCustomBorderColorExtensionName* = "VK_EXT_custom_border_color"

type
  SamplerCustomBorderColorCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    customBorderColor*: ClearColorValue
    format*: Format
  PhysicalDeviceCustomBorderColorPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxCustomBorderColorSamplers*: uint32
  PhysicalDeviceCustomBorderColorFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    customBorderColors*: Bool32
    customBorderColorWithoutFormat*: Bool32


