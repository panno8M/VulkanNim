# Generated at 2021-12-26T16:57:01Z
# VK_EXT_provoking_vertex

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
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



