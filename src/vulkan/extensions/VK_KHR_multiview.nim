# Generated at 2021-08-30T14:31:10Z
# VK_KHR_multiview


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2

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

