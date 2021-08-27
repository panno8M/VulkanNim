
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtTransformFeedbackSpecVersion* = 1
  ExtTransformFeedbackExtensionName* = "VK_EXT_transform_feedback"

type
  PhysicalDeviceTransformFeedbackFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    transformFeedback*: Bool32
    geometryStreams*: Bool32
  PhysicalDeviceTransformFeedbackPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
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
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineRasterizationStateStreamCreateFlagsEXT
    rasterizationStream*: uint32
  PipelineRasterizationStateStreamCreateFlagsEXT* = distinct Flags

var # commands
  cmdBindTransformFeedbackBuffersEXTCage: proc(commandBuffer: CommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr Buffer; pOffsets: ptr DeviceSize; pSizes: ptr DeviceSize;): void {.cdecl.}
  cmdBeginTransformFeedbackEXTCage: proc(commandBuffer: CommandBuffer; firstCounterBuffer: uint32; counterBufferCount: uint32; pCounterBuffers: ptr Buffer; pCounterBufferOffsets: ptr DeviceSize;): void {.cdecl.}
  cmdEndTransformFeedbackEXTCage: proc(commandBuffer: CommandBuffer; firstCounterBuffer: uint32; counterBufferCount: uint32; pCounterBuffers: ptr Buffer; pCounterBufferOffsets: ptr DeviceSize;): void {.cdecl.}
  cmdBeginQueryIndexedEXTCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; query: uint32; flags: QueryControlFlags; index: uint32;): void {.cdecl.}
  cmdEndQueryIndexedEXTCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; query: uint32; index: uint32;): void {.cdecl.}
  cmdDrawIndirectByteCountEXTCage: proc(commandBuffer: CommandBuffer; instanceCount: uint32; firstInstance: uint32; counterBuffer: Buffer; counterBufferOffset: DeviceSize; counterOffset: uint32; vertexStride: uint32;): void {.cdecl.}
proc cmdBindTransformFeedbackBuffersEXT*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers: ptr Buffer;
      pOffsets: ptr DeviceSize;
      pSizes: ptr DeviceSize;
    ): void {.cdecl.} =
  cmdBindTransformFeedbackBuffersEXTCage(commandBuffer,firstBinding,bindingCount,pBuffers,pOffsets,pSizes)
proc cmdBeginTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount: uint32;
      pCounterBuffers: ptr Buffer;
      pCounterBufferOffsets: ptr DeviceSize;
    ): void {.cdecl.} =
  cmdBeginTransformFeedbackEXTCage(commandBuffer,firstCounterBuffer,counterBufferCount,pCounterBuffers,pCounterBufferOffsets)
proc cmdEndTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount: uint32;
      pCounterBuffers: ptr Buffer;
      pCounterBufferOffsets: ptr DeviceSize;
    ): void {.cdecl.} =
  cmdEndTransformFeedbackEXTCage(commandBuffer,firstCounterBuffer,counterBufferCount,pCounterBuffers,pCounterBufferOffsets)
proc cmdBeginQueryIndexedEXT*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags: QueryControlFlags;
      index: uint32;
    ): void {.cdecl.} =
  cmdBeginQueryIndexedEXTCage(commandBuffer,queryPool,query,flags,index)
proc cmdEndQueryIndexedEXT*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      index: uint32;
    ): void {.cdecl.} =
  cmdEndQueryIndexedEXTCage(commandBuffer,queryPool,query,index)
proc cmdDrawIndirectByteCountEXT*(
      commandBuffer: CommandBuffer;
      instanceCount: uint32;
      firstInstance: uint32;
      counterBuffer: Buffer;
      counterBufferOffset: DeviceSize;
      counterOffset: uint32;
      vertexStride: uint32;
    ): void {.cdecl.} =
  cmdDrawIndirectByteCountEXTCage(commandBuffer,instanceCount,firstInstance,counterBuffer,counterBufferOffset,counterOffset,vertexStride)
proc loadVK_EXT_transform_feedback*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdBindTransformFeedbackBuffersEXTCage << "vkCmdBindTransformFeedbackBuffersEXT"
  cmdBeginTransformFeedbackEXTCage << "vkCmdBeginTransformFeedbackEXT"
  cmdEndTransformFeedbackEXTCage << "vkCmdEndTransformFeedbackEXT"
  cmdBeginQueryIndexedEXTCage << "vkCmdBeginQueryIndexedEXT"
  cmdEndQueryIndexedEXTCage << "vkCmdEndQueryIndexedEXT"
  cmdDrawIndirectByteCountEXTCage << "vkCmdDrawIndirectByteCountEXT"