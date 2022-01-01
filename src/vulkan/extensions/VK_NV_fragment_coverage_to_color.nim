# VK_NV_fragment_coverage_to_color

import ../features/vk10
import ../platform
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



