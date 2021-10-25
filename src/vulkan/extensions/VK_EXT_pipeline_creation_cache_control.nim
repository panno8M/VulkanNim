# Generated at 2021-10-24T02:03:03Z
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

Result.defineAliases:
  pipelineCompileRequiredExt as errorPipelineCompileRequiredExt


