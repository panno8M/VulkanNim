# VK_AMD_pipeline_compiler_control

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  AmdPipelineCompilerControlSpecVersion* = 1
  AmdPipelineCompilerControlExtensionName* = "VK_AMD_pipeline_compiler_control"

type
  PipelineCompilerControlCreateInfoAMD* = object
    sType* {.constant: (StructureType.pipelineCompilerControlCreateInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    compilerControlFlags* {.optional.}: PipelineCompilerControlFlagsAMD



