# Generated at 2021-10-24T02:03:04Z
# VK_EXT_4444_formats

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  Ext4444FormatsSpecVersion* = 1
  Ext4444FormatsExtensionName* = "VK_EXT_4444_formats"

type
  PhysicalDevice4444FormatsFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDevice4444FormatsFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    formatA4R4G4B4*: Bool32
    formatA4B4G4R4*: Bool32



