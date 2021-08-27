
import ../platform
import ../features/vk10


const
  AmdRasterizationOrderSpecVersion* = 1
  AmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

type
  RasterizationOrderAMD* {.size: sizeof(int32), pure.} = enum
    StrictAmd = 0
    RelaxedAmd = 1
  PipelineRasterizationStateRasterizationOrderAMD* = object
    sType*: StructureType
    pNext*: pointer
    rasterizationOrder*: RasterizationOrderAMD


