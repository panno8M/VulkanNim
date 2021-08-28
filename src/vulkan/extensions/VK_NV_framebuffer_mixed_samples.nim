# Generated at 2021-08-28T12:28:00Z
# VK_NV_framebuffer_mixed_samples
# =================================

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
  PipelineCoverageModulationStateCreateFlagsNV* = Flags[distinct UnusedEnum]
  CoverageModulationModeNV* {.size: sizeof(int32), pure.} = enum
    noneNv = 0
    rgbNv = 1
    alphaNv = 2
    rgbaNv = 3



