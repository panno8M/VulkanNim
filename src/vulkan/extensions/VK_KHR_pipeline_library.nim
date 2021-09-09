# Generated at 2021-09-09T01:49:36Z
# VK_KHR_pipeline_library


import ../platform
import ../features/vk10

const
  KhrPipelineLibrarySpecVersion* = 1
  KhrPipelineLibraryExtensionName* = "VK_KHR_pipeline_library"

type
  PipelineLibraryCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    libraryCount*: uint32
    pLibraries*: ptr Pipeline



