# VK_EXT_scalar_block_layout

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  ExtScalarBlockLayoutSpecVersion* = 1
  ExtScalarBlockLayoutExtensionName* = "VK_EXT_scalar_block_layout"

type
  PhysicalDeviceScalarBlockLayoutFeaturesEXT* = object



