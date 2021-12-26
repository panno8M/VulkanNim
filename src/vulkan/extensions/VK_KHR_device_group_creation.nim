# Generated at 2021-12-26T10:16:14Z
# VK_KHR_device_group_creation

import ../platform

import ../features/vk10
import ../features/vk11

prepareVulkanLibDef()

const
  KhrDeviceGroupCreationSpecVersion* = 1
  KhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"

type
  PhysicalDeviceGroupPropertiesKHR* = object
  DeviceGroupDeviceCreateInfoKHR* = object

const enumeratePhysicalDeviceGroupsKHR* = enumeratePhysicalDeviceGroups

