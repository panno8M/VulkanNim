# Generated at 2021-08-30T14:31:10Z
# VK_QCOM_render_pass_transform


import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_KHR_surface

const
  QcomRenderPassTransformSpecVersion* = 1
  QcomRenderPassTransformExtensionName* = "VK_QCOM_render_pass_transform"

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


