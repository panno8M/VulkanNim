# Generated at 2021-09-09T01:49:36Z
# VK_KHR_multiview


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11
export VK_KHR_get_physical_device_properties2

const
  KhrMultiviewSpecVersion* = 1
  KhrMultiviewExtensionName* = "VK_KHR_multiview"

type
  RenderPassMultiviewCreateInfoKHR* = object
  PhysicalDeviceMultiviewFeaturesKHR* = object
  PhysicalDeviceMultiviewPropertiesKHR* = object

DependencyFlagBits.defineAliases:
  viewLocal as viewLocalKhr

StructureType.defineAliases:
  renderPassMultiviewCreateInfo as renderPassMultiviewCreateInfoKhr
  physicalDeviceMultiviewFeatures as physicalDeviceMultiviewFeaturesKhr
  physicalDeviceMultiviewProperties as physicalDeviceMultiviewPropertiesKhr


