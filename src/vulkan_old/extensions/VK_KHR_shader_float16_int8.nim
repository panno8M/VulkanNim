# Generated at 2021-10-24T02:03:04Z
# VK_KHR_shader_float16_int8

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrShaderFloat16Int8SpecVersion* = 1
  KhrShaderFloat16Int8ExtensionName* = "VK_KHR_shader_float16_int8"

type
  PhysicalDeviceShaderFloat16Int8FeaturesKHR* = object
  PhysicalDeviceFloat16Int8FeaturesKHR* = object

StructureType.defineAliases:
  physicalDeviceShaderFloat16Int8Features as physicalDeviceShaderFloat16Int8FeaturesKhr
  physicalDeviceShaderFloat16Int8Features as physicalDeviceFloat16Int8FeaturesKhr


