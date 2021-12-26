# Generated at 2021-12-26T10:16:14Z
# VK_EXT_index_type_uint8

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  ExtIndexTypeUint8SpecVersion* = 1
  ExtIndexTypeUint8ExtensionName* = "VK_EXT_index_type_uint8"

type
  PhysicalDeviceIndexTypeUint8FeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceIndexTypeUint8FeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    indexTypeUint8*: Bool32



