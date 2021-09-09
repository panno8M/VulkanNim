# Generated at 2021-09-09T01:49:36Z
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
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: Bool32
    coverageToColorLocation*: uint32



