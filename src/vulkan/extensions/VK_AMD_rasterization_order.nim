# Generated at 2021-08-28T12:28:00Z
# VK_AMD_rasterization_order
# =================================

import ../platform
import ../features/vk10


const
  AmdRasterizationOrderSpecVersion* = 1
  AmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

type
  RasterizationOrderAMD* {.size: sizeof(int32), pure.} = enum
    strictAmd = 0
    relaxedAmd = 1
  PipelineRasterizationStateRasterizationOrderAMD* = object
    sType*: StructureType
    pNext*: pointer
    rasterizationOrder*: RasterizationOrderAMD



