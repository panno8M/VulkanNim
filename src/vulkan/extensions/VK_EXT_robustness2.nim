# Generated at 2021-08-31T05:18:46Z
# VK_EXT_robustness2


import ../platform
import ../features/vk10

const
  ExtRobustness2SpecVersion* = 1
  ExtRobustness2ExtensionName* = "VK_EXT_robustness2"

type
  PhysicalDeviceRobustness2FeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    robustBufferAccess2*: Bool32
    robustImageAccess2*: Bool32
    nullDescriptor*: Bool32
  PhysicalDeviceRobustness2PropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    robustStorageBufferAccessSizeAlignment*: DeviceSize
    robustUniformBufferAccessSizeAlignment*: DeviceSize



