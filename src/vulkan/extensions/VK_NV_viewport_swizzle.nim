# Generated at 2021-12-26T10:16:14Z
# VK_NV_viewport_swizzle

import ../platform

import ../features/vk10

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



