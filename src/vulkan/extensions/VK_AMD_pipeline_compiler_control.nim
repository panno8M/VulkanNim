
import ../platform
import ../features/vk10


type
  PipelineCompilerControlFlagsAMD* = distinct Flags
  PipelineCompilerControlCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    compilerControlFlags*: PipelineCompilerControlFlagsAMD
  PipelineCompilerControlFlagBitsAMD* = UnusedEnum

const AmdPipelineCompilerControlSpecVersion* = 1
const AmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

