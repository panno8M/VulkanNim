# Generated at 2021-09-10T05:27:58Z
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
      pSizes: ptr DeviceSize;
    ): void {.cdecl, lazyload("vkCmdBindTransformFeedbackBuffersEXT", DeviceLevel).}
proc cmdBeginTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount: uint32;
      pCounterBuffers: ptr Buffer;
      pCounterBufferOffsets: ptr DeviceSize;
    ): void {.cdecl, lazyload("vkCmdBeginTransformFeedbackEXT", DeviceLevel).}
proc cmdEndTransformFeedbackEXT*(
      commandBuffer: CommandBuffer;
      firstCounterBuffer: uint32;
      counterBufferCount: uint32;
      pCounterBuffers: ptr Buffer;
      pCounterBufferOffsets: ptr DeviceSize;
    ): void {.cdecl, lazyload("vkCmdEndTransformFeedbackEXT", DeviceLevel).}
proc cmdBeginQueryIndexedEXT*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags: QueryControlFlags;
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
  cmdBindTransformFeedbackBuffersEXT.smartLoad(instance)
  cmdBeginTransformFeedbackEXT.smartLoad(instance)
  cmdEndTransformFeedbackEXT.smartLoad(instance)
  cmdBeginQueryIndexedEXT.smartLoad(instance)
  cmdEndQueryIndexedEXT.smartLoad(instance)
  cmdDrawIndirectByteCountEXT.smartLoad(instance)

proc loadVK_EXT_transform_feedback*(device: Device) =
  cmdBindTransformFeedbackBuffersEXT.smartLoad(device)
  cmdBeginTransformFeedbackEXT.smartLoad(device)
  cmdEndTransformFeedbackEXT.smartLoad(device)
  cmdBeginQueryIndexedEXT.smartLoad(device)
  cmdEndQueryIndexedEXT.smartLoad(device)
  cmdDrawIndirectByteCountEXT.smartLoad(device)

