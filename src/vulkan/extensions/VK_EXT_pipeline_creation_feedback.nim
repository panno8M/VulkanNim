# VK_EXT_pipeline_creation_feedback

import ../features/vk10
import ../platform
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



