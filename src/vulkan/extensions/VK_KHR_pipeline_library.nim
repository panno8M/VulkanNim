# Generated at 2021-10-24T02:03:03Z
# VK_KHR_pipeline_library

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  KhrPipelineLibrarySpecVersion* = 1
  KhrPipelineLibraryExtensionName* = "VK_KHR_pipeline_library"

type
  PipelineLibraryCreateInfoKHR* = object
    sType* {.constant: (StructureType.pipelineLibraryCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    libraryCount* {.optional.}: uint32
    pLibraries* {.length: libraryCount.}: arrPtr[Pipeline]



