# Generated at 2021-08-28T00:52:26Z
# VK_KHR_shader_float16_int8
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrShaderFloat16Int8SpecVersion* = 1
  KhrShaderFloat16Int8ExtensionName* = "VK_KHR_shader_float16_int8"

type
  PhysicalDeviceShaderFloat16Int8FeaturesKHR* = object
  PhysicalDeviceFloat16Int8FeaturesKHR* = object

StructureType.defineAliases:
  PhysicalDeviceShaderFloat16Int8Features as PhysicalDeviceShaderFloat16Int8FeaturesKhr
  PhysicalDeviceShaderFloat16Int8Features as PhysicalDeviceFloat16Int8FeaturesKhr

