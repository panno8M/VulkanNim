
import ../platform
import ../features/vk10


type
  PipelineCoverageModulationStateCreateFlagsNV* = Flags
  CoverageModulationModeNV* {.size: sizeof(int32), pure.} = enum
    None = 0
    Rgb = 1
    Alpha = 2
    Rgba = 3
  PipelineCoverageModulationStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCoverageModulationStateCreateFlagsNV
    coverageModulationMode*: CoverageModulationModeNV
    coverageModulationTableEnable*: Bool32
    coverageModulationTableCount*: uint32
    pCoverageModulationTable*: ptr float32

const NvFramebufferMixedSamplesSpecVersion* = 1
const NvFramebufferMixedSamplesExtensionName* = "VK_NV_framebuffer_mixed_samples"

