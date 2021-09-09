# Generated at 2021-09-09T01:49:36Z
# VK_EXT_pipeline_creation_cache_control


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

Result.defineAliases:
  pipelineCompileRequiredExt as errorPipelineCompileRequiredExt


