# Generated at 2021-12-25T14:19:30Z
# VK_EXT_pipeline_creation_cache_control

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtPipelineCreationCacheControlSpecVersion* = 3
  ExtPipelineCreationCacheControlExtensionName* = "VK_EXT_pipeline_creation_cache_control"

type
  PhysicalDevicePipelineCreationCacheControlFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDevicePipelineCreationCacheControlFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    pipelineCreationCacheControl*: Bool32



