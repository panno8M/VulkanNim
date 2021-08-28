# Generated at 2021-08-28T00:52:26Z
# VK_KHR_device_group_creation
# =================================

import ../platform
import ../features/vk10


const
  KhrDeviceGroupCreationSpecVersion* = 1
  KhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"
  MaxDeviceGroupSizeKhr* = MaxDeviceGroupSize

type
  PhysicalDeviceGroupPropertiesKHR* = object
  DeviceGroupDeviceCreateInfoKHR* = object

var # commands
  
const enumeratePhysicalDeviceGroupsKHR* = enumeratePhysicalDeviceGroups
StructureType.defineAliases:
  PhysicalDeviceGroupProperties as PhysicalDeviceGroupPropertiesKhr
  DeviceGroupDeviceCreateInfo as DeviceGroupDeviceCreateInfoKhr

MemoryHeapFlagBits.defineAliases:
  MultiInstance as MultiInstanceBitKhr

proc loadVK_KHR_device_group_creation*(instance: Instance) =
  instance.defineLoader(`<<`)

  enumeratePhysicalDeviceGroupsKHRCage << "vkEnumeratePhysicalDeviceGroupsKHR"