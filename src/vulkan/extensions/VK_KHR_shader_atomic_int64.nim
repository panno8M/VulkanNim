# VK_KHR_shader_atomic_int64

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  KhrShaderAtomicInt64SpecVersion* = 1
  KhrShaderAtomicInt64ExtensionName* = "VK_KHR_shader_atomic_int64"

type
  PhysicalDeviceShaderAtomicInt64FeaturesKHR* = object



