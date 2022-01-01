# VK_KHR_imageless_framebuffer

import ../features/vk10
import VK_KHR_maintenance2
import VK_KHR_image_format_list
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  KhrImagelessFramebufferSpecVersion* = 1
  KhrImagelessFramebufferExtensionName* = "VK_KHR_imageless_framebuffer"

type
  PhysicalDeviceImagelessFramebufferFeaturesKHR* = object
  FramebufferAttachmentsCreateInfoKHR* = object
  FramebufferAttachmentImageInfoKHR* = object
  RenderPassAttachmentBeginInfoKHR* = object



