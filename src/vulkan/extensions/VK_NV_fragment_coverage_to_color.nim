
import ../platform
import ../features/vk10




type
  PipelineCoverageToColorStateCreateFlagsNV* = distinct Flags
  PipelineCoverageToColorStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: Bool32
    coverageToColorLocation*: uint32


