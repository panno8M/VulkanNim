# Generated at 2021-12-26T10:16:14Z
# VK_KHR_external_fence_capabilities

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrExternalFenceCapabilitiesSpecVersion* = 1
  KhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"

type
  PhysicalDeviceExternalFenceInfoKHR* = object
  ExternalFencePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

const getPhysicalDeviceExternalFencePropertiesKHR* = getPhysicalDeviceExternalFenceProperties

