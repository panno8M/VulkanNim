# Generated at 2021-08-31T05:18:46Z
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



