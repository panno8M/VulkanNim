# VK_EXT_vertex_attribute_divisor

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtVertexAttributeDivisorSpecVersion* = 3
  ExtVertexAttributeDivisorExtensionName* = "VK_EXT_vertex_attribute_divisor"

type
  PhysicalDeviceVertexAttributeDivisorPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceVertexAttributeDivisorPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxVertexAttribDivisor*: uint32
  VertexInputBindingDivisorDescriptionEXT* = object
    binding*: uint32
    divisor*: uint32
  PipelineVertexInputDivisorStateCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineVertexInputDivisorStateCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    vertexBindingDivisorCount*: uint32
    pVertexBindingDivisors* {.length: vertexBindingDivisorCount.}: arrPtr[VertexInputBindingDivisorDescriptionEXT]
  PhysicalDeviceVertexAttributeDivisorFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceVertexAttributeDivisorFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    vertexAttributeInstanceRateDivisor*: Bool32
    vertexAttributeInstanceRateZeroDivisor*: Bool32



