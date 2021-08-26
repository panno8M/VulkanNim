
import ../platform
import ../features/vk10
import VK_KHR_swapchain
import VK_GGP_stream_descriptor_surface




type
  PresentFrameTokenGGP* = object
    sType*: StructureType
    pNext*: pointer
    frameToken*: GgpFrameToken


