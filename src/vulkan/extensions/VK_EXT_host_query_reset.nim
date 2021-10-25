# Generated at 2021-10-24T02:03:03Z
# VK_EXT_host_query_reset

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  ExtHostQueryResetSpecVersion* = 1
  ExtHostQueryResetExtensionName* = "VK_EXT_host_query_reset"

type
  PhysicalDeviceHostQueryResetFeaturesEXT* = object

const resetQueryPoolEXT* = resetQueryPool
StructureType.defineAliases:
  physicalDeviceHostQueryResetFeatures as physicalDeviceHostQueryResetFeaturesExt


