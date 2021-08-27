# Generated at 2021-08-27T06:01:03Z
# VK_EXT_pipeline_creation_feedback
# =================================

import ../platform
import ../features/vk10


const
  ExtPipelineCreationFeedbackSpecVersion* = 1
  ExtPipelineCreationFeedbackExtensionName* = "VK_EXT_pipeline_creation_feedback"

type
  PipelineCreationFeedbackFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    ValidBitExt = 0x00000001
    ApplicationPipelineCacheHitBitExt = 0x00000002
    BasePipelineAccelerationBitExt = 0x00000004
  PipelineCreationFeedbackFlagsEXT* = distinct Flags
  PipelineCreationFeedbackCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    pPipelineCreationFeedback*: ptr PipelineCreationFeedbackEXT
    pipelineStageCreationFeedbackCount*: uint32
    pPipelineStageCreationFeedbacks*: ptr PipelineCreationFeedbackEXT
  PipelineCreationFeedbackEXT* = object
    flags*: PipelineCreationFeedbackFlagsEXT
    duration*: uint64


