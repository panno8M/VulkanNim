
import ../platform
import ../features/vk10
import VK_KHR_swapchain
import VK_KHR_surface


type
  CommandBufferInheritanceRenderPassTransformInfoQCOM* = object
    sType*: StructureType
    pNext*: pointer
    transform*: SurfaceTransformFlagBitsKHR
    renderArea*: Rect2D
  RenderPassTransformBeginInfoQCOM* = object
    sType*: StructureType
    pNext*: pointer
    transform*: SurfaceTransformFlagBitsKHR

const QcomRenderPassTransformExtensionName* = "VK_QCOM_render_pass_transform"
const QcomRenderPassTransformSpecVersion* = 1

