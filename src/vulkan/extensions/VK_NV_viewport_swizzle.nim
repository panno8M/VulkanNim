# Generated at 2021-09-10T05:27:58Z
# VK_NV_viewport_swizzle


import ../platform
import ../features/vk10

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
    pViewportSwizzles*: ptr ViewportSwizzleNV



