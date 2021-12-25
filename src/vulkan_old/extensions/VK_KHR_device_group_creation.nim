# Generated at 2021-10-24T02:03:03Z
# VK_KHR_device_group_creation

import ../platform
import ../features/vk10
import ../features/vk11

prepareVulkanLibDef()

const
  KhrDeviceGroupCreationSpecVersion* = 1
  KhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"
  MaxDeviceGroupSizeKhr* = MaxDeviceGroupSize

type
  PhysicalDeviceGroupPropertiesKHR* = object
  DeviceGroupDeviceCreateInfoKHR* = object

const enumeratePhysicalDeviceGroupsKHR* = enumeratePhysicalDeviceGroups
StructureType.defineAliases:
  physicalDeviceGroupProperties as physicalDeviceGroupPropertiesKhr
  deviceGroupDeviceCreateInfo as deviceGroupDeviceCreateInfoKhr

MemoryHeapFlagBits.defineAliases:
  multiInstance as multiInstanceKhr


