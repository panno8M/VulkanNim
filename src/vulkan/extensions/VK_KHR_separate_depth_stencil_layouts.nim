# VK_KHR_separate_depth_stencil_layouts

import ../features/vk10
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  KhrSeparateDepthStencilLayoutsSpecVersion* = 1
  KhrSeparateDepthStencilLayoutsExtensionName* = "VK_KHR_separate_depth_stencil_layouts"

type
  PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR* = object
  AttachmentReferenceStencilLayoutKHR* = object
  AttachmentDescriptionStencilLayoutKHR* = object



