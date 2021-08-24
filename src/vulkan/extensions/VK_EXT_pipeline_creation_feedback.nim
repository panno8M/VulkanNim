
import ../platform
import ../features/vk10


type
  PipelineCreationFeedbackFlagBitsEXT* = UnusedEnum
  PipelineCreationFeedbackEXT* = object
    flags*: PipelineCreationFeedbackFlagsEXT
    duration*: uint64
  PipelineCreationFeedbackCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    pPipelineCreationFeedback*: ptr PipelineCreationFeedbackEXT
    pipelineStageCreationFeedbackCount*: uint32
    pPipelineStageCreationFeedbacks*: ptr PipelineCreationFeedbackEXT
  PipelineCreationFeedbackFlagsEXT* = distinct Flags

const ExtPipelineCreationFeedbackSpecVersion* = 1
const ExtPipelineCreationFeedbackExtensionName* = "VK_EXT_pipeline_creation_feedback"

