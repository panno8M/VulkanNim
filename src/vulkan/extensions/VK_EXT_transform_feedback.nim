# Generated at 2021-12-30T17:13:13Z
# VK_EXT_transform_feedback

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  ExtTransformFeedbackSpecVersion* = 1
  ExtTransformFeedbackExtensionName* = "VK_EXT_transform_feedback"

type
  PhysicalDeviceTransformFeedbackFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceTransformFeedbackFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    transformFeedback*: Bool32
    geometryStreams*: Bool32
  PhysicalDeviceTransformFeedbackPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceTransformFeedbackPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxTransformFeedbackStreams*: uint32
    maxTransformFeedbackBuffers*: uint32
    maxTransformFeedbackBufferSize*: DeviceSize
    maxTransformFeedbackStreamDataSize*: uint32
    maxTransformFeedbackBufferDataSize*: uint32
    maxTransformFeedbackBufferDataStride*: uint32
    transformFeedbackQueries*: Bool32
    transformFeedbackStreamsLinesTriangles*: Bool32
    transformFeedbackRasterizationStreamSelect*: Bool32
    transformFeedbackDraw*: Bool32
  PipelineRasterizationStateStreamCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineRasterizationStateStreamCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineRasterizationStateStreamCreateFlagsEXT
    rasterizationStream*: uint32

proc cmdBindTransformFeedbackBuffersEXT*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers {.length: bindingCount.}: arrPtr[Buffer];
      pOffsets {.length: bindingCount.}: arrPtr[DeviceSize];
      pSizes {.length: bindingCount.} = default(arrPtr[DeviceSize]);
    ): void {.cdecl, lazyload("vkCmdBindTransformFeedbackBuffersEXT", DeviceLevel).}
proc cmdBeginTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount = default(uint32);
      pCounterBuffers {.length: counterBufferCount.}: arrPtr[Buffer];
      pCounterBufferOffsets {.length: counterBufferCount.} = default(arrPtr[DeviceSize]);
    ): void {.cdecl, lazyload("vkCmdBeginTransformFeedbackEXT", DeviceLevel).}
proc cmdEndTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount = default(uint32);
      pCounterBuffers {.length: counterBufferCount.}: arrPtr[Buffer];
      pCounterBufferOffsets {.length: counterBufferCount.} = default(arrPtr[DeviceSize]);
    ): void {.cdecl, lazyload("vkCmdEndTransformFeedbackEXT", DeviceLevel).}
proc cmdBeginQueryIndexedEXT*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags = default(QueryControlFlags);
      index: uint32;
    ): void {.cdecl, lazyload("vkCmdBeginQueryIndexedEXT", DeviceLevel).}
proc cmdEndQueryIndexedEXT*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      index: uint32;
    ): void {.cdecl, lazyload("vkCmdEndQueryIndexedEXT", DeviceLevel).}
proc cmdDrawIndirectByteCountEXT*(
      commandBuffer: CommandBuffer;
      instanceCount: uint32;
      firstInstance: uint32;
      counterBuffer: Buffer;
      counterBufferOffset: DeviceSize;
      counterOffset: uint32;
      vertexStride: uint32;
    ): void {.cdecl, lazyload("vkCmdDrawIndirectByteCountEXT", DeviceLevel).}

proc loadAllVK_EXT_transform_feedback*(instance: Instance) = instance.loadCommands:
  cmdBindTransformFeedbackBuffersEXT
  cmdBeginTransformFeedbackEXT
  cmdEndTransformFeedbackEXT
  cmdBeginQueryIndexedEXT
  cmdEndQueryIndexedEXT
  cmdDrawIndirectByteCountEXT
proc loadVK_EXT_transform_feedback*(device: Device) = device.loadCommands:
  cmdBindTransformFeedbackBuffersEXT
  cmdBeginTransformFeedbackEXT
  cmdEndTransformFeedbackEXT
  cmdBeginQueryIndexedEXT
  cmdEndQueryIndexedEXT
  cmdDrawIndirectByteCountEXT
