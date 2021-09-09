# Generated at 2021-09-09T01:49:36Z
# VK_AMD_pipeline_compiler_control


import ../platform
import ../features/vk10

const
  AmdPipelineCompilerControlSpecVersion* = 1
  AmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

type # enums and bitmasks
  PipelineCompilerControlFlagBitsAMD* = distinct UnusedEnum
  PipelineCompilerControlFlagsAMD* = Flags[PipelineCompilerControlFlagBitsAMD]

type
  PipelineCompilerControlCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    compilerControlFlags*: PipelineCompilerControlFlagsAMD



