
import ../platform
import ../features/vk10


type
  PipelineLibraryCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    libraryCount*: uint32
    pLibraries*: ptr Pipeline

const KhrPipelineLibrarySpecVersion* = 1
const KhrPipelineLibraryExtensionName* = "VK_KHR_pipeline_library"

