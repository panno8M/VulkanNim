# VK_EXT_provoking_vertex

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtProvokingVertexSpecVersion* = 1
  ExtProvokingVertexExtensionName* = "VK_EXT_provoking_vertex"

type
  PhysicalDeviceProvokingVertexFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceProvokingVertexFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    provokingVertexLast*: Bool32
    transformFeedbackPreservesProvokingVertex*: Bool32
  PhysicalDeviceProvokingVertexPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceProvokingVertexPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    provokingVertexModePerPipeline*: Bool32
    transformFeedbackPreservesTriangleFanProvokingVertex*: Bool32
  PipelineRasterizationProvokingVertexStateCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineRasterizationProvokingVertexStateCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    provokingVertexMode*: ProvokingVertexModeEXT



