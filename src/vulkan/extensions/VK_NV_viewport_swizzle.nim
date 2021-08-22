
import ../platform
import ../features/vk10


type
  ViewportCoordinateSwizzleNV* {.size: sizeof(int32), pure.} = enum
    PositiveX = 0
    NegativeX = 1
    PositiveY = 2
    NegativeY = 3
    PositiveZ = 4
    NegativeZ = 5
    PositiveW = 6
    NegativeW = 7
  ViewportSwizzleNV* = object
    x*: ViewportCoordinateSwizzleNV
    y*: ViewportCoordinateSwizzleNV
    z*: ViewportCoordinateSwizzleNV
    w*: ViewportCoordinateSwizzleNV
  PipelineViewportSwizzleStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineViewportSwizzleStateCreateFlagsNV
    viewportCount*: uint32
    pViewportSwizzles*: ptr ViewportSwizzleNV
  PipelineViewportSwizzleStateCreateFlagsNV* = Flags

const NvViewportSwizzleSpecVersion* = 1
const NvViewportSwizzleExtensionName* = "VK_NV_viewport_swizzle"

