# Generated at 2021-08-27T06:01:03Z
# VK_EXT_4444_formats
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  Ext4444FormatsSpecVersion* = 1
  Ext4444FormatsExtensionName* = "VK_EXT_4444_formats"

type
  PhysicalDevice4444FormatsFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    formatA4R4G4B4*: Bool32
    formatA4B4G4R4*: Bool32

