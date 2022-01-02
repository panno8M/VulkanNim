# VK_EXT_fragment_shader_interlock

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtFragmentShaderInterlockSpecVersion* = 1
  ExtFragmentShaderInterlockExtensionName* = "VK_EXT_fragment_shader_interlock"

type
  PhysicalDeviceFragmentShaderInterlockFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentShaderInterlockFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    fragmentShaderSampleInterlock*: Bool32
    fragmentShaderPixelInterlock*: Bool32
    fragmentShaderShadingRateInterlock*: Bool32



