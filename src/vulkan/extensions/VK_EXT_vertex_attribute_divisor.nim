# Generated at 2021-09-09T01:49:36Z
# VK_EXT_vertex_attribute_divisor


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtVertexAttributeDivisorSpecVersion* = 3
  ExtVertexAttributeDivisorExtensionName* = "VK_EXT_vertex_attribute_divisor"

type
  PhysicalDeviceVertexAttributeDivisorPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxVertexAttribDivisor*: uint32
  VertexInputBindingDivisorDescriptionEXT* = object
    binding*: uint32
    divisor*: uint32
  PipelineVertexInputDivisorStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    vertexBindingDivisorCount*: uint32
    pVertexBindingDivisors*: ptr VertexInputBindingDivisorDescriptionEXT
  PhysicalDeviceVertexAttributeDivisorFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    vertexAttributeInstanceRateDivisor*: Bool32
    vertexAttributeInstanceRateZeroDivisor*: Bool32



