# Generated at 2021-12-26T16:57:01Z
# VK_NV_inherited_viewport_scissor

import ../platform

import ../features/vk10

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



