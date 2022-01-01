# VK_KHR_pipeline_library

import ../features/vk10
import ../platform
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



