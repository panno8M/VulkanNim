# Generated at 2021-12-26T10:16:14Z
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



