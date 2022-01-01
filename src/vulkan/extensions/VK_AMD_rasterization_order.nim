# VK_AMD_rasterization_order

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  AmdRasterizationOrderSpecVersion* = 1
  AmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

type
  PipelineRasterizationStateRasterizationOrderAMD* = object
    sType* {.constant: (StructureType.pipelineRasterizationStateRasterizationOrderAmd).}: StructureType
    pNext* {.optional.}: pointer
    rasterizationOrder*: RasterizationOrderAMD



