
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
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
  VertexInputBindingDivisorDescriptionEXT* = object
    binding*: uint32
    divisor*: uint32
  PhysicalDeviceVertexAttributeDivisorPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxVertexAttribDivisor*: uint32

const ExtVertexAttributeDivisorSpecVersion* = 3
const ExtVertexAttributeDivisorExtensionName* = "VK_EXT_vertex_attribute_divisor"

