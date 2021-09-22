# Generated at 2021-09-22T15:02:54Z
# VK_NV_fragment_coverage_to_color


import ../platform
import ../features/vk10

const
  NvFragmentCoverageToColorSpecVersion* = 1
  NvFragmentCoverageToColorExtensionName* = "VK_NV_fragment_coverage_to_color"

type # enums and bitmasks
  PipelineCoverageToColorStateCreateFlagsNV* = Flags[distinct UnusedEnum]

type
  PipelineCoverageToColorStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineCoverageToColorStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: Bool32
    coverageToColorLocation* {.optional.}: uint32



