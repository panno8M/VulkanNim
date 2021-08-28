# Generated at 2021-08-28T00:52:26Z
# VK_EXT_scalar_block_layout
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtScalarBlockLayoutSpecVersion* = 1
  ExtScalarBlockLayoutExtensionName* = "VK_EXT_scalar_block_layout"

type
  PhysicalDeviceScalarBlockLayoutFeaturesEXT* = object

StructureType.defineAliases:
  PhysicalDeviceScalarBlockLayoutFeatures as PhysicalDeviceScalarBlockLayoutFeaturesExt

