# Generated at 2021-08-27T06:01:03Z
# VK_KHR_pipeline_library
# =================================

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


