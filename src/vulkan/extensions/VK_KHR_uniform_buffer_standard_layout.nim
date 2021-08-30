# Generated at 2021-08-30T23:05:46Z
# VK_KHR_uniform_buffer_standard_layout


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12

const
  KhrUniformBufferStandardLayoutSpecVersion* = 1
  KhrUniformBufferStandardLayoutExtensionName* = "VK_KHR_uniform_buffer_standard_layout"

type
  PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR* = object

StructureType.defineAliases:
  physicalDeviceUniformBufferStandardLayoutFeatures as physicalDeviceUniformBufferStandardLayoutFeaturesKhr

