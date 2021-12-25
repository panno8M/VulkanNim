# Generated at 2021-12-25T14:19:30Z
# VK_EXT_pipeline_creation_feedback

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtPipelineCreationFeedbackSpecVersion* = 1
  ExtPipelineCreationFeedbackExtensionName* = "VK_EXT_pipeline_creation_feedback"

type
  PipelineCreationFeedbackCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineCreationFeedbackCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pPipelineCreationFeedback*: ptr PipelineCreationFeedbackEXT
    pipelineStageCreationFeedbackCount*: uint32
    pPipelineStageCreationFeedbacks* {.length: pipelineStageCreationFeedbackCount.}: arrPtr[arrPtr[PipelineCreationFeedbackEXT]]
  PipelineCreationFeedbackEXT* = object
    flags*: PipelineCreationFeedbackFlagsEXT
    duration*: uint64



