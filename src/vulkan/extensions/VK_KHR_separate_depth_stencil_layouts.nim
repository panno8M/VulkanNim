# Generated at 2021-08-28T00:52:26Z
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

StructureType.defineAliases:
  PhysicalDeviceSeparateDepthStencilLayoutsFeatures as PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKhr
  AttachmentReferenceStencilLayout as AttachmentReferenceStencilLayoutKhr
  AttachmentDescriptionStencilLayout as AttachmentDescriptionStencilLayoutKhr

ImageLayout.defineAliases:
  DepthAttachmentOptimal as DepthAttachmentOptimalKhr
  DepthReadOnlyOptimal as DepthReadOnlyOptimalKhr
  StencilAttachmentOptimal as StencilAttachmentOptimalKhr
  StencilReadOnlyOptimal as StencilReadOnlyOptimalKhr

