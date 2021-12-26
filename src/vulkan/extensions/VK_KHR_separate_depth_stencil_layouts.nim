# Generated at 2021-12-26T10:16:14Z
# VK_KHR_separate_depth_stencil_layouts

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_create_renderpass2
import ../features/vk12
export VK_KHR_get_physical_device_properties2
export VK_KHR_create_renderpass2

prepareVulkanLibDef()

const
  KhrSeparateDepthStencilLayoutsSpecVersion* = 1
  KhrSeparateDepthStencilLayoutsExtensionName* = "VK_KHR_separate_depth_stencil_layouts"

type
  PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR* = object
  AttachmentReferenceStencilLayoutKHR* = object
  AttachmentDescriptionStencilLayoutKHR* = object



