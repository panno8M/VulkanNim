# VK_KHR_shader_clock

import ../features/vk10
import ../platform
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



