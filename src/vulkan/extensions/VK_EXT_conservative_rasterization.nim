# VK_EXT_conservative_rasterization

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtConservativeRasterizationSpecVersion* = 1
  ExtConservativeRasterizationExtensionName* = "VK_EXT_conservative_rasterization"

type
  PhysicalDeviceConservativeRasterizationPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceConservativeRasterizationPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    primitiveOverestimationSize*: float32
    maxExtraPrimitiveOverestimationSize*: float32
    extraPrimitiveOverestimationSizeGranularity*: float32
    primitiveUnderestimation*: Bool32
    conservativePointAndLineRasterization*: Bool32
    degenerateTrianglesRasterized*: Bool32
    degenerateLinesRasterized*: Bool32
    fullyCoveredFragmentShaderInputVariable*: Bool32
    conservativeRasterizationPostDepthCoverage*: Bool32
  PipelineRasterizationConservativeStateCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineRasterizationConservativeStateCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineRasterizationConservativeStateCreateFlagsEXT
    conservativeRasterizationMode*: ConservativeRasterizationModeEXT
    extraPrimitiveOverestimationSize*: float32



