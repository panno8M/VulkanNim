
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
    PositiveXNv = 0
    NegativeXNv = 1
    PositiveYNv = 2
    NegativeYNv = 3
    PositiveZNv = 4
    NegativeZNv = 5
    PositiveWNv = 6
    NegativeWNv = 7
  PipelineViewportSwizzleStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineViewportSwizzleStateCreateFlagsNV
    viewportCount*: uint32
    pViewportSwizzles*: ptr ViewportSwizzleNV
  PipelineViewportSwizzleStateCreateFlagsNV* = distinct Flags


