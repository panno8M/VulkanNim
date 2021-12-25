# Generated at 2021-12-25T14:19:30Z
# VK_GGP_frame_token

import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_GGP_stream_descriptor_surface
export VK_KHR_swapchain
export VK_GGP_stream_descriptor_surface

prepareVulkanLibDef()

const
  GgpFrameTokenSpecVersion* = 1
  GgpFrameTokenExtensionName* = "VK_GGP_frame_token"

type
  PresentFrameTokenGGP* = object
    sType* {.constant: (StructureType.presentFrameTokenGgp).}: StructureType
    pNext* {.optional.}: pointer
    frameToken*: GgpFrameToken



