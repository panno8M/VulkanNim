# Generated at 2021-12-25T14:19:30Z
# VK_AMD_rasterization_order

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  AmdRasterizationOrderSpecVersion* = 1
  AmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

type
  PipelineRasterizationStateRasterizationOrderAMD* = object
    sType* {.constant: (StructureType.pipelineRasterizationStateRasterizationOrderAmd).}: StructureType
    pNext* {.optional.}: pointer
    rasterizationOrder*: RasterizationOrderAMD



