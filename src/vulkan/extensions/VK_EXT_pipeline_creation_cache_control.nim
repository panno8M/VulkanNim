
import ../platform
import ../features/vk10


type
  PhysicalDevicePipelineCreationCacheControlFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    pipelineCreationCacheControl*: Bool32

const ExtPipelineCreationCacheControlSpecVersion* = 3
const ExtPipelineCreationCacheControlExtensionName* = "VK_EXT_pipeline_creation_cache_control"

