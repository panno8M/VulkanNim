
import ../platform
import ../features/vk10




type
  PipelineCompilerControlFlagBitsAMD* = UnusedEnum
  PipelineCompilerControlFlagsAMD* = distinct Flags
  PipelineCompilerControlCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    compilerControlFlags*: PipelineCompilerControlFlagsAMD


