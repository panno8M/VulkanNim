# VK_GGP_frame_token

import ../features/vk10
import VK_KHR_swapchain
import VK_GGP_stream_descriptor_surface
import ../platform
prepareVulkanLibDef()

const
  GgpFrameTokenSpecVersion* = 1
  GgpFrameTokenExtensionName* = "VK_GGP_frame_token"

type
  PresentFrameTokenGGP* = object
    sType* {.constant: (StructureType.presentFrameTokenGgp).}: StructureType
    pNext* {.optional.}: pointer
    frameToken*: GgpFrameToken



