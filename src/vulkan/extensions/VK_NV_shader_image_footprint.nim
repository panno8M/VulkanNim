# Generated at 2021-08-31T05:18:46Z
# VK_NV_shader_image_footprint


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvShaderImageFootprintSpecVersion* = 2
  NvShaderImageFootprintExtensionName* = "VK_NV_shader_image_footprint"

type
  PhysicalDeviceShaderImageFootprintFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    imageFootprint*: Bool32



