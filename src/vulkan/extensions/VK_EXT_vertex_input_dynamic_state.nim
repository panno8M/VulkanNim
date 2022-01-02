# VK_EXT_vertex_input_dynamic_state

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtVertexInputDynamicStateSpecVersion* = 2
  ExtVertexInputDynamicStateExtensionName* = "VK_EXT_vertex_input_dynamic_state"

type
  PhysicalDeviceVertexInputDynamicStateFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceVertexInputDynamicStateFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    vertexInputDynamicState*: Bool32
  VertexInputBindingDescription2EXT* = object
    sType* {.constant: (StructureType.vertexInputBindingDescription2Ext).}: StructureType
    pNext* {.optional.}: pointer
    binding*: uint32
    stride*: uint32
    inputRate*: VertexInputRate
    divisor*: uint32
  VertexInputAttributeDescription2EXT* = object
    sType* {.constant: (StructureType.vertexInputAttributeDescription2Ext).}: StructureType
    pNext* {.optional.}: pointer
    location*: uint32
    binding*: uint32
    format*: Format
    offset*: uint32

proc cmdSetVertexInputEXT*(
      commandBuffer: CommandBuffer;
      vertexBindingDescriptionCount = default(uint32);
      pVertexBindingDescriptions {.length: vertexBindingDescriptionCount.}: arrPtr[VertexInputBindingDescription2EXT];
      vertexAttributeDescriptionCount = default(uint32);
      pVertexAttributeDescriptions {.length: vertexAttributeDescriptionCount.}: arrPtr[VertexInputAttributeDescription2EXT];
    ): void {.cdecl, lazyload("vkCmdSetVertexInputEXT", DeviceLevel).}

proc loadAllVK_EXT_vertex_input_dynamic_state*(instance: Instance) = instance.loadCommands:
  cmdSetVertexInputEXT
proc loadVK_EXT_vertex_input_dynamic_state*(device: Device) = device.loadCommands:
  cmdSetVertexInputEXT
