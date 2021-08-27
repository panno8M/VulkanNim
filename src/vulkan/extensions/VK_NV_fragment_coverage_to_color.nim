# Generated at 2021-08-27T06:01:02Z
# VK_NV_fragment_coverage_to_color
# =================================

import ../platform
import ../features/vk10


const
  NvFragmentCoverageToColorSpecVersion* = 1
  NvFragmentCoverageToColorExtensionName* = "VK_NV_fragment_coverage_to_color"

type
  PipelineCoverageToColorStateCreateFlagsNV* = distinct Flags
  PipelineCoverageToColorStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: Bool32
    coverageToColorLocation*: uint32

