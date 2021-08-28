# Generated at 2021-08-28T00:52:26Z
# VK_KHR_imageless_framebuffer
# =================================

import ../platform
import ../features/vk10
import VK_KHR_maintenance2
import VK_KHR_image_format_list


const
  KhrImagelessFramebufferSpecVersion* = 1
  KhrImagelessFramebufferExtensionName* = "VK_KHR_imageless_framebuffer"

type
  PhysicalDeviceImagelessFramebufferFeaturesKHR* = object
  FramebufferAttachmentsCreateInfoKHR* = object
  FramebufferAttachmentImageInfoKHR* = object
  RenderPassAttachmentBeginInfoKHR* = object

StructureType.defineAliases:
  PhysicalDeviceImagelessFramebufferFeatures as PhysicalDeviceImagelessFramebufferFeaturesKhr
  FramebufferAttachmentsCreateInfo as FramebufferAttachmentsCreateInfoKhr
  FramebufferAttachmentImageInfo as FramebufferAttachmentImageInfoKhr
  RenderPassAttachmentBeginInfo as RenderPassAttachmentBeginInfoKhr

FramebufferCreateFlagBits.defineAliases:
  Imageless as ImagelessBitKhr

