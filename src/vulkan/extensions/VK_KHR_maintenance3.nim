# Generated at 2021-09-09T01:49:36Z
# VK_KHR_maintenance3


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11
export VK_KHR_get_physical_device_properties2

const
  KhrMaintenance3SpecVersion* = 1
  KhrMaintenance3ExtensionName* = "VK_KHR_maintenance3"

type
  PhysicalDeviceMaintenance3PropertiesKHR* = object
  DescriptorSetLayoutSupportKHR* = object

const getDescriptorSetLayoutSupportKHR* = getDescriptorSetLayoutSupport
StructureType.defineAliases:
  physicalDeviceMaintenance3Properties as physicalDeviceMaintenance3PropertiesKhr
  descriptorSetLayoutSupport as descriptorSetLayoutSupportKhr


