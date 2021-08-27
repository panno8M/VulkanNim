
import ../platform
import ../features/vk10


const
  AmdPipelineCompilerControlSpecVersion* = 1
  AmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

type
  PipelineCompilerControlFlagBitsAMD* = UnusedEnum
  PipelineCompilerControlFlagsAMD* = distinct Flags
  PipelineCompilerControlCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    compilerControlFlags*: PipelineCompilerControlFlagsAMD


