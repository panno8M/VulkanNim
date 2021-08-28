# Generated at 2021-08-28T12:28:01Z
# VK_NV_shader_image_footprint
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  NvShaderImageFootprintSpecVersion* = 2
  NvShaderImageFootprintExtensionName* = "VK_NV_shader_image_footprint"

type
  PhysicalDeviceShaderImageFootprintFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    imageFootprint*: Bool32



