
import ../platform
import ../features/vk10


type
  RasterizationOrderAMD* {.size: sizeof(int32), pure.} = enum
    Strict = 0
    Relaxed = 1
  PipelineRasterizationStateRasterizationOrderAMD* = object
    sType*: StructureType
    pNext*: pointer
    rasterizationOrder*: RasterizationOrderAMD

const AmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"
const AmdRasterizationOrderSpecVersion* = 1

