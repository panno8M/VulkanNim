# VK_KHR_external_memory_capabilities

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrExternalMemoryCapabilitiesSpecVersion* = 1
  KhrExternalMemoryCapabilitiesExtensionName* = "VK_KHR_external_memory_capabilities"

type
  ExternalMemoryPropertiesKHR* = object
  PhysicalDeviceExternalImageFormatInfoKHR* = object
  ExternalImageFormatPropertiesKHR* = object
  PhysicalDeviceExternalBufferInfoKHR* = object
  ExternalBufferPropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

const getPhysicalDeviceExternalBufferPropertiesKHR* = getPhysicalDeviceExternalBufferProperties

