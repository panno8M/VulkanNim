# Generated at 2021-08-31T05:18:46Z
# VK_AMD_rasterization_order


import ../platform
import ../features/vk10

const
  AmdRasterizationOrderSpecVersion* = 1
  AmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

type # enums and bitmasks
  RasterizationOrderAMD* {.size: sizeof(int32), pure.} = enum
    strictAmd = 0
    relaxedAmd = 1

type
  PipelineRasterizationStateRasterizationOrderAMD* = object
    sType*: StructureType
    pNext*: pointer
    rasterizationOrder*: RasterizationOrderAMD



