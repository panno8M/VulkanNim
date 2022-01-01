# VK_KHR_device_group_creation

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrDeviceGroupCreationSpecVersion* = 1
  KhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"

type
  PhysicalDeviceGroupPropertiesKHR* = object
  DeviceGroupDeviceCreateInfoKHR* = object

const enumeratePhysicalDeviceGroupsKHR* = enumeratePhysicalDeviceGroups

