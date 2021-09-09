# Generated at 2021-09-09T01:49:36Z
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
    sType*: StructureType
    pNext*: pointer
    fragmentShaderSampleInterlock*: Bool32
    fragmentShaderPixelInterlock*: Bool32
    fragmentShaderShadingRateInterlock*: Bool32



