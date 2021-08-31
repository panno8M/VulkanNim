# Generated at 2021-08-31T05:18:45Z
# VK_KHR_imageless_framebuffer


import ../platform
import ../features/vk10
import ./VK_KHR_maintenance2
import ./VK_KHR_image_format_list
import ../features/vk12
export VK_KHR_maintenance2
export VK_KHR_image_format_list

const
  KhrImagelessFramebufferSpecVersion* = 1
  KhrImagelessFramebufferExtensionName* = "VK_KHR_imageless_framebuffer"

type
  PhysicalDeviceImagelessFramebufferFeaturesKHR* = object
  FramebufferAttachmentsCreateInfoKHR* = object
  FramebufferAttachmentImageInfoKHR* = object
  RenderPassAttachmentBeginInfoKHR* = object

StructureType.defineAliases:
  physicalDeviceImagelessFramebufferFeatures as physicalDeviceImagelessFramebufferFeaturesKhr
  framebufferAttachmentsCreateInfo as framebufferAttachmentsCreateInfoKhr
  framebufferAttachmentImageInfo as framebufferAttachmentImageInfoKhr
  renderPassAttachmentBeginInfo as renderPassAttachmentBeginInfoKhr

FramebufferCreateFlagBits.defineAliases:
  imageless as imagelessKhr


