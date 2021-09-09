# Generated at 2021-09-09T01:49:36Z
# VK_EXT_conservative_rasterization


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtConservativeRasterizationSpecVersion* = 1
  ExtConservativeRasterizationExtensionName* = "VK_EXT_conservative_rasterization"

type # enums and bitmasks
  PipelineRasterizationConservativeStateCreateFlagsEXT* = Flags[distinct UnusedEnum]
  ConservativeRasterizationModeEXT* {.size: sizeof(int32), pure.} = enum
    disabledExt = 0
    overestimateExt = 1
    underestimateExt = 2

type
  PhysicalDeviceConservativeRasterizationPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
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
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineRasterizationConservativeStateCreateFlagsEXT
    conservativeRasterizationMode*: ConservativeRasterizationModeEXT
    extraPrimitiveOverestimationSize*: float32



