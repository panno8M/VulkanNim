# Generated at 2021-10-24T02:03:04Z
# VK_EXT_robustness2

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtRobustness2SpecVersion* = 1
  ExtRobustness2ExtensionName* = "VK_EXT_robustness2"

type
  PhysicalDeviceRobustness2FeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceRobustness2FeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    robustBufferAccess2*: Bool32
    robustImageAccess2*: Bool32
    nullDescriptor*: Bool32
  PhysicalDeviceRobustness2PropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceRobustness2PropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    robustStorageBufferAccessSizeAlignment*: DeviceSize
    robustUniformBufferAccessSizeAlignment*: DeviceSize



