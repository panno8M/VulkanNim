# Generated at 2021-08-28T00:52:26Z
# VK_KHR_uniform_buffer_standard_layout
# =====================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrUniformBufferStandardLayoutSpecVersion* = 1
  KhrUniformBufferStandardLayoutExtensionName* = "VK_KHR_uniform_buffer_standard_layout"

type
  PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR* = object

StructureType.defineAliases:
  PhysicalDeviceUniformBufferStandardLayoutFeatures as PhysicalDeviceUniformBufferStandardLayoutFeaturesKhr

