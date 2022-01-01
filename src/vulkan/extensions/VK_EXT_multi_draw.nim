# VK_EXT_multi_draw

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtMultiDrawSpecVersion* = 1
  ExtMultiDrawExtensionName* = "VK_EXT_multi_draw"

type
  PhysicalDeviceMultiDrawFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceMultiDrawFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    multiDraw*: Bool32
  PhysicalDeviceMultiDrawPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceMultiDrawPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxMultiDrawCount*: uint32
  MultiDrawInfoEXT* = object
    firstVertex*: uint32
    vertexCount*: uint32
  MultiDrawIndexedInfoEXT* = object
    firstIndex*: uint32
    indexCount*: uint32
    vertexOffset*: int32

proc cmdDrawMultiEXT*(
      commandBuffer: CommandBuffer;
      drawCount = default(uint32);
      pVertexInfo {.length: drawCount.}: arrPtr[MultiDrawInfoEXT];
      instanceCount: uint32;
      firstInstance: uint32;
      stride: uint32;
    ): void {.cdecl, lazyload("vkCmdDrawMultiEXT", DeviceLevel).}
proc cmdDrawMultiIndexedEXT*(
      commandBuffer: CommandBuffer;
      drawCount = default(uint32);
      pIndexInfo {.length: drawCount.}: arrPtr[MultiDrawIndexedInfoEXT];
      instanceCount: uint32;
      firstInstance: uint32;
      stride: uint32;
      pVertexOffset = default(ptr int32);
    ): void {.cdecl, lazyload("vkCmdDrawMultiIndexedEXT", DeviceLevel).}

proc loadAllVK_EXT_multi_draw*(instance: Instance) = instance.loadCommands:
  cmdDrawMultiEXT
  cmdDrawMultiIndexedEXT
proc loadVK_EXT_multi_draw*(device: Device) = device.loadCommands:
  cmdDrawMultiEXT
  cmdDrawMultiIndexedEXT
