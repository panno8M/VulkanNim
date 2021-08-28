# Generated at 2021-08-28T00:52:26Z
# VK_KHR_shader_atomic_int64
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrShaderAtomicInt64SpecVersion* = 1
  KhrShaderAtomicInt64ExtensionName* = "VK_KHR_shader_atomic_int64"

type
  PhysicalDeviceShaderAtomicInt64FeaturesKHR* = object

StructureType.defineAliases:
  PhysicalDeviceShaderAtomicInt64Features as PhysicalDeviceShaderAtomicInt64FeaturesKhr

