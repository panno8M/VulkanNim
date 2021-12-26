# Generated at 2021-12-26T10:16:14Z
# VK_AMD_pipeline_compiler_control

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  AmdPipelineCompilerControlSpecVersion* = 1
  AmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

type
  PipelineCompilerControlCreateInfoAMD* = object
    sType* {.constant: (StructureType.pipelineCompilerControlCreateInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    compilerControlFlags* {.optional.}: PipelineCompilerControlFlagsAMD



