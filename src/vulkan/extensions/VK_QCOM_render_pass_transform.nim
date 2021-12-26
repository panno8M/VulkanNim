# Generated at 2021-12-26T16:57:01Z
# VK_QCOM_render_pass_transform

import ../platform

import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_KHR_surface
export VK_KHR_swapchain
export VK_KHR_surface
prepareVulkanLibDef()

const
  QcomRenderPassTransformSpecVersion* = 2
  QcomRenderPassTransformExtensionName* = "VK_QCOM_render_pass_transform"

type
  RenderPassTransformBeginInfoQCOM* = object
    sType* {.constant: (StructureType.renderPassTransformBeginInfoQcom).}: StructureType
    pNext* {.optional.}: pointer
    transform*: SurfaceTransformFlagBitsKHR
  CommandBufferInheritanceRenderPassTransformInfoQCOM* = object
    sType* {.constant: (StructureType.commandBufferInheritanceRenderPassTransformInfoQcom).}: StructureType
    pNext* {.optional.}: pointer
    transform*: SurfaceTransformFlagBitsKHR
    renderArea*: Rect2D



