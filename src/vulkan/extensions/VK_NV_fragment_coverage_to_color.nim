# Generated at 2021-12-26T10:16:14Z
# VK_NV_fragment_coverage_to_color

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  NvFragmentCoverageToColorSpecVersion* = 1
  NvFragmentCoverageToColorExtensionName* = "VK_NV_fragment_coverage_to_color"

type
  PipelineCoverageToColorStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineCoverageToColorStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: Bool32
    coverageToColorLocation* {.optional.}: uint32



