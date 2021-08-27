# Generated at 2021-08-27T06:01:03Z
# VK_GGP_frame_token
# =================================

import ../platform
import ../features/vk10
import VK_KHR_swapchain
import VK_GGP_stream_descriptor_surface


const
  GgpFrameTokenSpecVersion* = 1
  GgpFrameTokenExtensionName* = "VK_GGP_frame_token"

type
  PresentFrameTokenGGP* = object
    sType*: StructureType
    pNext*: pointer
    frameToken*: GgpFrameToken


