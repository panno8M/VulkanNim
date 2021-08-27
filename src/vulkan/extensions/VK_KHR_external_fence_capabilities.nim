# Generated at 2021-08-27T06:01:02Z
# VK_KHR_external_fence_capabilities
# ==================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrExternalFenceCapabilitiesSpecVersion* = 1
  KhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"
  LuidSizeKhr* = LuidSize

type
  {name}* = {Alias}
  ExternalFenceHandleTypeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  ExternalFenceFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceExternalFenceInfoKHR* = object
  ExternalFencePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

var # commands
  
const getPhysicalDeviceExternalFencePropertiesKHR* = getPhysicalDeviceExternalFenceProperties
proc loadVK_KHR_external_fence_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalFencePropertiesKHRCage << "vkGetPhysicalDeviceExternalFencePropertiesKHR"