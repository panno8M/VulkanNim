# Generated at 2021-08-28T12:28:01Z
# VK_AMD_pipeline_compiler_control
# =================================

import ../platform
import ../features/vk10


const
  AmdPipelineCompilerControlSpecVersion* = 1
  AmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

type
  PipelineCompilerControlFlagBitsAMD* = distinct UnusedEnum
  PipelineCompilerControlFlagsAMD* = Flags[PipelineCompilerControlFlagBitsAMD]
  PipelineCompilerControlCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    compilerControlFlags*: PipelineCompilerControlFlagsAMD



