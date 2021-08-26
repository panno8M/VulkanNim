
import ../platform
import ../features/vk10




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


