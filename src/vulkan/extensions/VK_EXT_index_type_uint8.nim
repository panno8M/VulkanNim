# Generated at 2021-09-10T05:27:58Z
# VK_EXT_index_type_uint8


import ../platform
import ../features/vk10

const
  ExtIndexTypeUint8SpecVersion* = 1
  ExtIndexTypeUint8ExtensionName* = "VK_EXT_index_type_uint8"

type
  PhysicalDeviceIndexTypeUint8FeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceIndexTypeUint8FeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    indexTypeUint8*: Bool32



