# VK_NV_inherited_viewport_scissor

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvInheritedViewportScissorSpecVersion* = 1
  NvInheritedViewportScissorExtensionName* = "VK_NV_inherited_viewport_scissor"

type
  PhysicalDeviceInheritedViewportScissorFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceInheritedViewportScissorFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    inheritedViewportScissor2D*: Bool32
  CommandBufferInheritanceViewportScissorInfoNV* = object
    sType* {.constant: (StructureType.commandBufferInheritanceViewportScissorInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    viewportScissor2D*: Bool32
    viewportDepthCount*: uint32
    pViewportDepths*: ptr Viewport



