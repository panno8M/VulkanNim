# Generated at 2021-12-26T10:16:14Z
# VK_KHR_driver_properties

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrDriverPropertiesSpecVersion* = 1
  KhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"

type
  ConformanceVersionKHR* = object
  PhysicalDeviceDriverPropertiesKHR* = object



