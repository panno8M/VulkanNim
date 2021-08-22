
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  ConservativeRasterizationModeEXT* {.size: sizeof(int32), pure.} = enum
    Disabled = 0
    Overestimate = 1
    Underestimate = 2
  PipelineRasterizationConservativeStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineRasterizationConservativeStateCreateFlagsEXT
    conservativeRasterizationMode*: ConservativeRasterizationModeEXT
    extraPrimitiveOverestimationSize*: float32
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
  PipelineRasterizationConservativeStateCreateFlagsEXT* = Flags

const ExtConservativeRasterizationSpecVersion* = 1
const ExtConservativeRasterizationExtensionName* = "VK_EXT_conservative_rasterization"

