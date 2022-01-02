# VK_NV_shader_image_footprint

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvShaderImageFootprintSpecVersion* = 2
  NvShaderImageFootprintExtensionName* = "VK_NV_shader_image_footprint"

type
  PhysicalDeviceShaderImageFootprintFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceShaderImageFootprintFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    imageFootprint*: Bool32



