# VK_KHR_synchronization2

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrSynchronization2SpecVersion* = 1
  KhrSynchronization2ExtensionName* = "VK_KHR_synchronization2"
  PipelineStageNoneKhr* = 0
  AccessNoneKhr* = 0

type
  MemoryBarrier2KHR* = object
    sType* {.constant: (StructureType.memoryBarrier2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcStageMask* {.optional.}: PipelineStageFlags2KHR
    srcAccessMask* {.optional.}: AccessFlags2KHR
    dstStageMask* {.optional.}: PipelineStageFlags2KHR
    dstAccessMask* {.optional.}: AccessFlags2KHR
  BufferMemoryBarrier2KHR* = object
    sType* {.constant: (StructureType.bufferMemoryBarrier2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcStageMask* {.optional.}: PipelineStageFlags2KHR
    srcAccessMask* {.optional.}: AccessFlags2KHR
    dstStageMask* {.optional.}: PipelineStageFlags2KHR
    dstAccessMask* {.optional.}: AccessFlags2KHR
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    buffer*: Buffer
    offset*: DeviceSize
    size*: DeviceSize
  ImageMemoryBarrier2KHR* = object
    sType* {.constant: (StructureType.imageMemoryBarrier2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcStageMask* {.optional.}: PipelineStageFlags2KHR
    srcAccessMask* {.optional.}: AccessFlags2KHR
    dstStageMask* {.optional.}: PipelineStageFlags2KHR
    dstAccessMask* {.optional.}: AccessFlags2KHR
    oldLayout*: ImageLayout
    newLayout*: ImageLayout
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    image*: Image
    subresourceRange*: ImageSubresourceRange
  DependencyInfoKHR* = object
    sType* {.constant: (StructureType.dependencyInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    dependencyFlags* {.optional.}: DependencyFlags
    memoryBarrierCount* {.optional.}: uint32
    pMemoryBarriers* {.length: memoryBarrierCount.}: arrPtr[MemoryBarrier2KHR]
    bufferMemoryBarrierCount* {.optional.}: uint32
    pBufferMemoryBarriers* {.length: bufferMemoryBarrierCount.}: arrPtr[BufferMemoryBarrier2KHR]
    imageMemoryBarrierCount* {.optional.}: uint32
    pImageMemoryBarriers* {.length: imageMemoryBarrierCount.}: arrPtr[ImageMemoryBarrier2KHR]
  SubmitInfo2KHR* = object
    sType* {.constant: (StructureType.submitInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SubmitFlagsKHR
    waitSemaphoreInfoCount* {.optional.}: uint32
    pWaitSemaphoreInfos* {.length: waitSemaphoreInfoCount.}: arrPtr[SemaphoreSubmitInfoKHR]
    commandBufferInfoCount* {.optional.}: uint32
    pCommandBufferInfos* {.length: commandBufferInfoCount.}: arrPtr[CommandBufferSubmitInfoKHR]
    signalSemaphoreInfoCount* {.optional.}: uint32
    pSignalSemaphoreInfos* {.length: signalSemaphoreInfoCount.}: arrPtr[SemaphoreSubmitInfoKHR]
  SemaphoreSubmitInfoKHR* = object
    sType* {.constant: (StructureType.semaphoreSubmitInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    value*: uint64
    stageMask* {.optional.}: PipelineStageFlags2KHR
    deviceIndex*: uint32
  CommandBufferSubmitInfoKHR* = object
    sType* {.constant: (StructureType.commandBufferSubmitInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    commandBuffer*: CommandBuffer
    deviceMask*: uint32
  PhysicalDeviceSynchronization2FeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceSynchronization2FeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    synchronization2*: Bool32

  QueueFamilyCheckpointProperties2NV* = object
    sType* {.constant: (StructureType.queueFamilyCheckpointProperties2Nv).}: StructureType
    pNext* {.optional.}: pointer
    checkpointExecutionStageMask*: PipelineStageFlags2KHR
  CheckpointData2NV* = object
    sType* {.constant: (StructureType.checkpointData2Nv).}: StructureType
    pNext* {.optional.}: pointer
    stage*: PipelineStageFlags2KHR
    pCheckpointMarker*: pointer

proc cmdSetEvent2KHR*(
      commandBuffer: CommandBuffer;
      event: Event;
      pDependencyInfo: ptr DependencyInfoKHR;
    ): void {.cdecl, lazyload("vkCmdSetEvent2KHR", DeviceLevel).}
proc cmdResetEvent2KHR*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask = default(PipelineStageFlags2KHR);
    ): void {.cdecl, lazyload("vkCmdResetEvent2KHR", DeviceLevel).}
proc cmdWaitEvents2KHR*(
      commandBuffer: CommandBuffer;
      eventCount: uint32;
      pEvents {.length: eventCount.}: arrPtr[Event];
      pDependencyInfos {.length: eventCount.}: arrPtr[DependencyInfoKHR];
    ): void {.cdecl, lazyload("vkCmdWaitEvents2KHR", DeviceLevel).}
proc cmdPipelineBarrier2KHR*(
      commandBuffer: CommandBuffer;
      pDependencyInfo: ptr DependencyInfoKHR;
    ): void {.cdecl, lazyload("vkCmdPipelineBarrier2KHR", DeviceLevel).}
proc cmdWriteTimestamp2KHR*(
      commandBuffer: CommandBuffer;
      stage = default(PipelineStageFlags2KHR);
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl, lazyload("vkCmdWriteTimestamp2KHR", DeviceLevel).}
proc queueSubmit2KHR*(
      queue: Queue;
      submitCount = default(uint32);
      pSubmits {.length: submitCount.}: arrPtr[SubmitInfo2KHR];
      fence = default(Fence);
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      lazyload("vkQueueSubmit2KHR", DeviceLevel).}


proc cmdWriteBufferMarker2AMD*(
      commandBuffer: CommandBuffer;
      stage = default(PipelineStageFlags2KHR);
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      marker: uint32;
    ): void {.cdecl, lazyload("vkCmdWriteBufferMarker2AMD", DeviceLevel).}


proc getQueueCheckpointData2NV*(
      queue: Queue;
      pCheckpointDataCount: ptr uint32;
      pCheckpointData {.length: pCheckpointDataCount.} = default(arrPtr[CheckpointData2NV]);
    ): void {.cdecl, lazyload("vkGetQueueCheckpointData2NV", DeviceLevel).}

proc loadAllVK_KHR_synchronization2*(instance: Instance) = instance.loadCommands:
  cmdSetEvent2KHR
  cmdResetEvent2KHR
  cmdWaitEvents2KHR
  cmdPipelineBarrier2KHR
  cmdWriteTimestamp2KHR
  queueSubmit2KHR
  cmdWriteBufferMarker2AMD
  getQueueCheckpointData2NV
proc loadVK_KHR_synchronization2*(device: Device) = device.loadCommands:
  cmdSetEvent2KHR
  cmdResetEvent2KHR
  cmdWaitEvents2KHR
  cmdPipelineBarrier2KHR
  cmdWriteTimestamp2KHR
  queueSubmit2KHR
  cmdWriteBufferMarker2AMD
  getQueueCheckpointData2NV
