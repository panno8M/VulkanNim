# Generated at 2021-08-31T05:18:45Z
# VK_EXT_index_type_uint8


import ../platform
import ../features/vk10

const
  ExtIndexTypeUint8SpecVersion* = 1
  ExtIndexTypeUint8ExtensionName* = "VK_EXT_index_type_uint8"

type
  PhysicalDeviceIndexTypeUint8FeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    indexTypeUint8*: Bool32



