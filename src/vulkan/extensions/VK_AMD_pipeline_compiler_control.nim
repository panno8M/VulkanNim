# Generated at 2021-08-27T06:01:03Z
# VK_AMD_pipeline_compiler_control
# =================================

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


