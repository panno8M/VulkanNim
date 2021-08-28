# Generated at 2021-08-28T00:52:26Z
# VK_KHR_multiview
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrMultiviewSpecVersion* = 1
  KhrMultiviewExtensionName* = "VK_KHR_multiview"

type
  RenderPassMultiviewCreateInfoKHR* = object
  PhysicalDeviceMultiviewFeaturesKHR* = object
  PhysicalDeviceMultiviewPropertiesKHR* = object

DependencyFlagBits.defineAliases:
  ViewLocal as ViewLocalBitKhr

StructureType.defineAliases:
  RenderPassMultiviewCreateInfo as RenderPassMultiviewCreateInfoKhr
  PhysicalDeviceMultiviewFeatures as PhysicalDeviceMultiviewFeaturesKhr
  PhysicalDeviceMultiviewProperties as PhysicalDeviceMultiviewPropertiesKhr

