
import ../platform
import ../features/vk10


type
  PhysicalDeviceCustomBorderColorFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    customBorderColors*: Bool32
    customBorderColorWithoutFormat*: Bool32
  SamplerCustomBorderColorCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    customBorderColor*: ClearColorValue
    format*: Format
  PhysicalDeviceCustomBorderColorPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxCustomBorderColorSamplers*: uint32

const ExtCustomBorderColorSpecVersion* = 12
const ExtCustomBorderColorExtensionName* = "VK_EXT_custom_border_color"

