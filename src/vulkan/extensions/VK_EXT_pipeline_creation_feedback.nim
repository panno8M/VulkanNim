
import ../platform
import ../features/vk10


type
  PipelineCreationFeedbackFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    Valid = 0x00000001
    ApplicationPipelineCacheHit = 0x00000002
    BasePipelineAcceleration = 0x00000004
  PipelineCreationFeedbackEXT* = object
    flags*: PipelineCreationFeedbackFlagsEXT
    duration*: uint64
  PipelineCreationFeedbackCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    pPipelineCreationFeedback*: ptr PipelineCreationFeedbackEXT
    pipelineStageCreationFeedbackCount*: uint32
    pPipelineStageCreationFeedbacks*: ptr PipelineCreationFeedbackEXT
  PipelineCreationFeedbackFlagsEXT* = Flags

const ExtPipelineCreationFeedbackSpecVersion* = 1
const ExtPipelineCreationFeedbackExtensionName* = "VK_EXT_pipeline_creation_feedback"

