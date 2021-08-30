# Generated at 2021-08-30T23:05:46Z
# VK_EXT_host_query_reset


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12

const
  ExtHostQueryResetSpecVersion* = 1
  ExtHostQueryResetExtensionName* = "VK_EXT_host_query_reset"

type
  PhysicalDeviceHostQueryResetFeaturesEXT* = object

const resetQueryPoolEXT* = resetQueryPool
StructureType.defineAliases:
  physicalDeviceHostQueryResetFeatures as physicalDeviceHostQueryResetFeaturesExt

