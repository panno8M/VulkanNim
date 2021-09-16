# Generated at 2021-09-16T07:11:43Z
# VK_EXT_transform_feedback


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtTransformFeedbackSpecVersion* = 1
  ExtTransformFeedbackExtensionName* = "VK_EXT_transform_feedback"

type # enums and bitmasks
  PipelineRasterizationStateStreamCreateFlagsEXT* = Flags[distinct UnusedEnum]

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
      pBuffers: ptr Buffer;
      pOffsets: ptr DeviceSize;
      pSizes = default(ptr DeviceSize); # optional
    ): void {.cdecl, lazyload("vkCmdBindTransformFeedbackBuffersEXT", DeviceLevel).}
proc cmdBeginTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount = default(uint32); # optional
      pCounterBuffers: ptr Buffer;
      pCounterBufferOffsets = default(ptr DeviceSize); # optional
    ): void {.cdecl, lazyload("vkCmdBeginTransformFeedbackEXT", DeviceLevel).}
proc cmdEndTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount = default(uint32); # optional
      pCounterBuffers: ptr Buffer;
      pCounterBufferOffsets = default(ptr DeviceSize); # optional
    ): void {.cdecl, lazyload("vkCmdEndTransformFeedbackEXT", DeviceLevel).}
proc cmdBeginQueryIndexedEXT*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags = default(QueryControlFlags); # optional
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

proc loadAllVK_EXT_transform_feedback*(instance: Instance) =
  cmdBindTransformFeedbackBuffersEXT.load(instance)
  cmdBeginTransformFeedbackEXT.load(instance)
  cmdEndTransformFeedbackEXT.load(instance)
  cmdBeginQueryIndexedEXT.load(instance)
  cmdEndQueryIndexedEXT.load(instance)
  cmdDrawIndirectByteCountEXT.load(instance)

proc loadVK_EXT_transform_feedback*(device: Device) =
  cmdBindTransformFeedbackBuffersEXT.load(device)
  cmdBeginTransformFeedbackEXT.load(device)
  cmdEndTransformFeedbackEXT.load(device)
  cmdBeginQueryIndexedEXT.load(device)
  cmdEndQueryIndexedEXT.load(device)
  cmdDrawIndirectByteCountEXT.load(device)

