# VK_QCOM_render_pass_transform

import ../features/vk10
import VK_KHR_swapchain
import VK_KHR_surface
import ../platform
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



