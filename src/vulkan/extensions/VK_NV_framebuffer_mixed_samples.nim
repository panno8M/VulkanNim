
import ../platform
import ../features/vk10


const
  NvFramebufferMixedSamplesSpecVersion* = 1
  NvFramebufferMixedSamplesExtensionName* = "VK_NV_framebuffer_mixed_samples"

type
  PipelineCoverageModulationStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCoverageModulationStateCreateFlagsNV
    coverageModulationMode*: CoverageModulationModeNV
    coverageModulationTableEnable*: Bool32
    coverageModulationTableCount*: uint32
    pCoverageModulationTable*: ptr float32
  PipelineCoverageModulationStateCreateFlagsNV* = distinct Flags
  CoverageModulationModeNV* {.size: sizeof(int32), pure.} = enum
    NoneNv = 0
    RgbNv = 1
    AlphaNv = 2
    RgbaNv = 3


