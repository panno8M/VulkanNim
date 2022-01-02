# VK_KHR_external_semaphore_capabilities

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrExternalSemaphoreCapabilitiesSpecVersion* = 1
  KhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"

type
  PhysicalDeviceExternalSemaphoreInfoKHR* = object
  ExternalSemaphorePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

const getPhysicalDeviceExternalSemaphorePropertiesKHR* = getPhysicalDeviceExternalSemaphoreProperties

