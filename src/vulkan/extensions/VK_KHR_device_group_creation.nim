# Generated at 2021-08-30T22:51:48Z
# VK_KHR_device_group_creation


import ../platform
import ../features/vk10

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

