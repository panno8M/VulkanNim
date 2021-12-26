# Generated at 2021-12-26T16:57:01Z
# VK_KHR_maintenance3

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  KhrMaintenance3SpecVersion* = 1
  KhrMaintenance3ExtensionName* = "VK_KHR_maintenance3"
  KhrMaintenance3SpecVersion* = KhrMaintenance3SpecVersion
  KhrMaintenance3ExtensionName* = KhrMaintenance3ExtensionName

type
  PhysicalDeviceMaintenance3PropertiesKHR* = object
  DescriptorSetLayoutSupportKHR* = object

const getDescriptorSetLayoutSupportKHR* = getDescriptorSetLayoutSupport

