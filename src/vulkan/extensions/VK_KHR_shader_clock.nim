# Generated at 2021-08-27T06:01:03Z
# VK_KHR_shader_clock
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrShaderClockSpecVersion* = 1
  KhrShaderClockExtensionName* = "VK_KHR_shader_clock"

type
  PhysicalDeviceShaderClockFeaturesKHR* = object
    sType*: StructureType
    pNext*: pointer
    shaderSubgroupClock*: Bool32
    shaderDeviceClock*: Bool32

