# VK_NV_framebuffer_mixed_samples

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvFramebufferMixedSamplesSpecVersion* = 1
  NvFramebufferMixedSamplesExtensionName* = "VK_NV_framebuffer_mixed_samples"

type
  PipelineCoverageModulationStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineCoverageModulationStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCoverageModulationStateCreateFlagsNV
    coverageModulationMode*: CoverageModulationModeNV
    coverageModulationTableEnable*: Bool32
    coverageModulationTableCount* {.optional.}: uint32
    pCoverageModulationTable* {.optional, length: coverageModulationTableCount.}: arrPtr[float32]



