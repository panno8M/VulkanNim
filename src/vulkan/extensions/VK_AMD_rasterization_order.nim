
import ../platform
import ../features/vk10




type
  RasterizationOrderAMD* {.size: sizeof(int32), pure.} = enum
    StrictAmd = 0
    RelaxedAmd = 1
  PipelineRasterizationStateRasterizationOrderAMD* = object
    sType*: StructureType
    pNext*: pointer
    rasterizationOrder*: RasterizationOrderAMD


