# Generated at 2021-08-28T12:28:00Z
# VK_NV_viewport_swizzle
# =================================

import ../platform
import ../features/vk10


const
  NvViewportSwizzleSpecVersion* = 1
  NvViewportSwizzleExtensionName* = "VK_NV_viewport_swizzle"

type
  ViewportSwizzleNV* = object
    x*: ViewportCoordinateSwizzleNV
    y*: ViewportCoordinateSwizzleNV
    z*: ViewportCoordinateSwizzleNV
    w*: ViewportCoordinateSwizzleNV
  ViewportCoordinateSwizzleNV* {.size: sizeof(int32), pure.} = enum
    positiveXNv = 0
    negativeXNv = 1
    positiveYNv = 2
    negativeYNv = 3
    positiveZNv = 4
    negativeZNv = 5
    positiveWNv = 6
    negativeWNv = 7
  PipelineViewportSwizzleStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineViewportSwizzleStateCreateFlagsNV
    viewportCount*: uint32
    pViewportSwizzles*: ptr ViewportSwizzleNV
  PipelineViewportSwizzleStateCreateFlagsNV* = Flags[distinct UnusedEnum]



