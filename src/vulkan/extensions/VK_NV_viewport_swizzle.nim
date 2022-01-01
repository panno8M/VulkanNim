# VK_NV_viewport_swizzle

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvViewportSwizzleSpecVersion* = 1
  NvViewportSwizzleExtensionName* = "VK_NV_viewport_swizzle"

type
  ViewportSwizzleNV* = object
    x*: ViewportCoordinateSwizzleNV
    y*: ViewportCoordinateSwizzleNV
    z*: ViewportCoordinateSwizzleNV
    w*: ViewportCoordinateSwizzleNV
  PipelineViewportSwizzleStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineViewportSwizzleStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineViewportSwizzleStateCreateFlagsNV
    viewportCount*: uint32
    pViewportSwizzles* {.length: viewportCount.}: arrPtr[ViewportSwizzleNV]



