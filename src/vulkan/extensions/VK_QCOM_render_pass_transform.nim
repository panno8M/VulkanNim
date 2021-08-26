
import ../platform
import ../features/vk10
import VK_KHR_swapchain
import VK_KHR_surface




type
  RenderPassTransformBeginInfoQCOM* = object
    sType*: StructureType
    pNext*: pointer
    transform*: SurfaceTransformFlagBitsKHR
  CommandBufferInheritanceRenderPassTransformInfoQCOM* = object
    sType*: StructureType
    pNext*: pointer
    transform*: SurfaceTransformFlagBitsKHR
    renderArea*: Rect2D


