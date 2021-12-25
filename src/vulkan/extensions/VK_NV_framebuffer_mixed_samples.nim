# Generated at 2021-12-25T07:50:19Z
# VK_NV_framebuffer_mixed_samples

import ../platform
import ../features/vk10

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



