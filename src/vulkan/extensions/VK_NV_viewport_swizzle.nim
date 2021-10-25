# Generated at 2021-10-24T02:03:03Z
# VK_NV_viewport_swizzle

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  NvViewportSwizzleSpecVersion* = 1
  NvViewportSwizzleExtensionName* = "VK_NV_viewport_swizzle"

type # enums and bitmasks
  ViewportCoordinateSwizzleNV* {.size: sizeof(int32), pure.} = enum
    positiveXNv = 0
    negativeXNv = 1
    positiveYNv = 2
    negativeYNv = 3
    positiveZNv = 4
    negativeZNv = 5
    positiveWNv = 6
    negativeWNv = 7
  PipelineViewportSwizzleStateCreateFlagsNV* = Flags[distinct UnusedEnum]

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



