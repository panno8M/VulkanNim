# VK_EXT_host_query_reset

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  ExtHostQueryResetSpecVersion* = 1
  ExtHostQueryResetExtensionName* = "VK_EXT_host_query_reset"

type
  PhysicalDeviceHostQueryResetFeaturesEXT* = object

const resetQueryPoolEXT* = resetQueryPool

