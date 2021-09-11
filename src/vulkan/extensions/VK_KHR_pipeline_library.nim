# Generated at 2021-09-10T05:27:58Z
# VK_KHR_pipeline_library


import ../platform
import ../features/vk10

const
  KhrPipelineLibrarySpecVersion* = 1
  KhrPipelineLibraryExtensionName* = "VK_KHR_pipeline_library"

type
  PipelineLibraryCreateInfoKHR* = object
    sType* {.constant: (StructureType.pipelineLibraryCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    libraryCount* {.optional.}: uint32
    pLibraries*: ptr Pipeline



