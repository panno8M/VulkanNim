# Generated at 2021-09-10T05:27:58Z
# VK_KHR_shader_clock


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  KhrShaderClockSpecVersion* = 1
  KhrShaderClockExtensionName* = "VK_KHR_shader_clock"

type
  PhysicalDeviceShaderClockFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderClockFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderSubgroupClock*: Bool32
    shaderDeviceClock*: Bool32



