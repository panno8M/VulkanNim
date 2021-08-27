# Generated at 2021-08-27T06:01:03Z
# VK_EXT_pipeline_creation_cache_control
# ======================================

import ../platform
import ../features/vk10


const
  ExtPipelineCreationCacheControlSpecVersion* = 3
  ExtPipelineCreationCacheControlExtensionName* = "VK_EXT_pipeline_creation_cache_control"

type
  PhysicalDevicePipelineCreationCacheControlFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    pipelineCreationCacheControl*: Bool32


