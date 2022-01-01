# VK_EXT_pipeline_creation_cache_control

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtPipelineCreationCacheControlSpecVersion* = 3
  ExtPipelineCreationCacheControlExtensionName* = "VK_EXT_pipeline_creation_cache_control"

type
  PhysicalDevicePipelineCreationCacheControlFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDevicePipelineCreationCacheControlFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    pipelineCreationCacheControl*: Bool32



