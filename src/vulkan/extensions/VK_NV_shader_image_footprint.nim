# Generated at 2021-10-24T02:03:03Z
# VK_NV_shader_image_footprint

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  NvShaderImageFootprintSpecVersion* = 2
  NvShaderImageFootprintExtensionName* = "VK_NV_shader_image_footprint"

type
  PhysicalDeviceShaderImageFootprintFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceShaderImageFootprintFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    imageFootprint*: Bool32



