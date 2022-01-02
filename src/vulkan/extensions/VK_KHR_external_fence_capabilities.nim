# VK_KHR_external_fence_capabilities

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrExternalFenceCapabilitiesSpecVersion* = 1
  KhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"

type
  PhysicalDeviceExternalFenceInfoKHR* = object
  ExternalFencePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

const getPhysicalDeviceExternalFencePropertiesKHR* = getPhysicalDeviceExternalFenceProperties

