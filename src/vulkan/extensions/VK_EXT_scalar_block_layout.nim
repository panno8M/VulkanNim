# Generated at 2021-09-09T01:49:36Z
# VK_EXT_scalar_block_layout


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

const
  ExtScalarBlockLayoutSpecVersion* = 1
  ExtScalarBlockLayoutExtensionName* = "VK_EXT_scalar_block_layout"

type
  PhysicalDeviceScalarBlockLayoutFeaturesEXT* = object

StructureType.defineAliases:
  physicalDeviceScalarBlockLayoutFeatures as physicalDeviceScalarBlockLayoutFeaturesExt


