# Generated at 2021-09-09T01:49:36Z
# VK_KHR_shader_atomic_int64


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

const
  KhrShaderAtomicInt64SpecVersion* = 1
  KhrShaderAtomicInt64ExtensionName* = "VK_KHR_shader_atomic_int64"

type
  PhysicalDeviceShaderAtomicInt64FeaturesKHR* = object

StructureType.defineAliases:
  physicalDeviceShaderAtomicInt64Features as physicalDeviceShaderAtomicInt64FeaturesKhr


