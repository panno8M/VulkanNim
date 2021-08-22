
import ../platform
import ../features/vk10


type
  PipelineCoverageToColorStateCreateFlagsNV* = Flags
  PipelineCoverageToColorStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: Bool32
    coverageToColorLocation*: uint32

const NvFragmentCoverageToColorSpecVersion* = 1
const NvFragmentCoverageToColorExtensionName* = "VK_NV_fragment_coverage_to_color"

