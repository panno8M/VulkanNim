# Generated at 2021-09-22T15:02:54Z
# VK_EXT_fragment_shader_interlock


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

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



