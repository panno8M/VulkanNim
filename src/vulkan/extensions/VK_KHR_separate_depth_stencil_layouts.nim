# Generated at 2021-08-27T06:01:03Z
# VK_KHR_separate_depth_stencil_layouts
# =====================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_create_renderpass2


const
  KhrSeparateDepthStencilLayoutsSpecVersion* = 1
  KhrSeparateDepthStencilLayoutsExtensionName* = "VK_KHR_separate_depth_stencil_layouts"

type
  PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR* = object
  AttachmentReferenceStencilLayoutKHR* = object
  AttachmentDescriptionStencilLayoutKHR* = object

