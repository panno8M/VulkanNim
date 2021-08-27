# Generated at 2021-08-27T06:01:03Z
# VK_EXT_host_query_reset
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtHostQueryResetSpecVersion* = 1
  ExtHostQueryResetExtensionName* = "VK_EXT_host_query_reset"

type
  PhysicalDeviceHostQueryResetFeaturesEXT* = object

var # commands
  
const resetQueryPoolEXT* = resetQueryPool
proc loadVK_EXT_host_query_reset*(instance: Instance) =
  instance.defineLoader(`<<`)

  resetQueryPoolEXTCage << "vkResetQueryPoolEXT"