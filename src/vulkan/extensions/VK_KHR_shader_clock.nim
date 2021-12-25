# Generated at 2021-12-25T07:50:19Z
# VK_KHR_shader_clock

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrShaderClockSpecVersion* = 1
  KhrShaderClockExtensionName* = "VK_KHR_shader_clock"

type
  PhysicalDeviceShaderClockFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderClockFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderSubgroupClock*: Bool32
    shaderDeviceClock*: Bool32



