# Generated at 2021-08-30T23:05:46Z
# VK_KHR_separate_depth_stencil_layouts


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_create_renderpass2
import ../features/vk12

const
  KhrSeparateDepthStencilLayoutsSpecVersion* = 1
  KhrSeparateDepthStencilLayoutsExtensionName* = "VK_KHR_separate_depth_stencil_layouts"

type
  PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR* = object
  AttachmentReferenceStencilLayoutKHR* = object
  AttachmentDescriptionStencilLayoutKHR* = object

StructureType.defineAliases:
  physicalDeviceSeparateDepthStencilLayoutsFeatures as physicalDeviceSeparateDepthStencilLayoutsFeaturesKhr
  attachmentReferenceStencilLayout as attachmentReferenceStencilLayoutKhr
  attachmentDescriptionStencilLayout as attachmentDescriptionStencilLayoutKhr

ImageLayout.defineAliases:
  depthAttachmentOptimal as depthAttachmentOptimalKhr
  depthReadOnlyOptimal as depthReadOnlyOptimalKhr
  stencilAttachmentOptimal as stencilAttachmentOptimalKhr
  stencilReadOnlyOptimal as stencilReadOnlyOptimalKhr

