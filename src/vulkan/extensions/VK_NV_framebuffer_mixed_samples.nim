# Generated at 2021-12-22T14:50:02Z
# VK_NV_framebuffer_mixed_samples

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  NvFramebufferMixedSamplesSpecVersion* = 1
  NvFramebufferMixedSamplesExtensionName* = "VK_NV_framebuffer_mixed_samples"

type # enums and bitmasks
  PipelineCoverageModulationStateCreateFlagsNV* = Flags[distinct UnusedEnum]
  CoverageModulationModeNV* {.size: sizeof(int32), pure.} = enum
    noneNv = 0
    rgbNv = 1
    alphaNv = 2
    rgbaNv = 3

type
  PipelineCoverageModulationStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineCoverageModulationStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCoverageModulationStateCreateFlagsNV
    coverageModulationMode*: CoverageModulationModeNV
    coverageModulationTableEnable*: Bool32
    coverageModulationTableCount* {.optional.}: uint32
    pCoverageModulationTable* {.optional, length: coverageModulationTableCount.}: arrPtr[float32]



