# Generated at 2021-12-26T10:42:47Z
# VK_KHR_imageless_framebuffer

import ../platform

import ../features/vk10
import ./VK_KHR_maintenance2
import ./VK_KHR_image_format_list
import ../features/vk12
export VK_KHR_maintenance2
export VK_KHR_image_format_list
prepareVulkanLibDef()

const
  KhrImagelessFramebufferSpecVersion* = 1
  KhrImagelessFramebufferExtensionName* = "VK_KHR_imageless_framebuffer"

type
  PhysicalDeviceImagelessFramebufferFeaturesKHR* = object
  FramebufferAttachmentsCreateInfoKHR* = object
  FramebufferAttachmentImageInfoKHR* = object
  RenderPassAttachmentBeginInfoKHR* = object



