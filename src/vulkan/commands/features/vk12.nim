# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_VERSION_1_2

import ../tools
const
  # VK_VERSION_1_2
  StructureTypePhysicalDeviceVulkan11Features* = 49
  StructureTypePhysicalDeviceVulkan11Properties* = 50
  StructureTypePhysicalDeviceVulkan12Features* = 51
  StructureTypePhysicalDeviceVulkan12Properties* = 52
  # Promoted from VK_KHR_sampler_mirror_clamp_to_edge (extension 15)
  SamplerAddressModeMirrorClampToEdge* = 4


# VK_VERSION_1_2
# ==============

template apiVersion12*(): ApiVersion =
  makeApiVersion(0, 1, 2, 0)

# Promoted from VK_KHR_draw_indirect_count (extension 170)
proc cmdDrawIndirectCount*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      countBuffer: Buffer;
      countBufferOffset: DeviceSize;
      maxDrawCount: uint32;
      stride: uint32;
    ): void {.preload("vkCmdDrawIndirectCount"),
      queues: QueueFlags{graphics},
      cmdbufferlevel: @[primary, secondary].}
proc cmdDrawIndexedIndirectCount*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      countBuffer: Buffer;
      countBufferOffset: DeviceSize;
      maxDrawCount: uint32;
      stride: uint32;
    ): void {.preload("vkCmdDrawIndexedIndirectCount"),
      queues: QueueFlags{graphics},
      cmdbufferlevel: @[primary, secondary].}
# Promoted from VK_KHR_create_renderpass2 (extension 110)
proc createRenderPass2*(
      device: Device;
      pCreateInfo: ptr RenderPassCreateInfo2;
      pAllocator = default(ptr AllocationCallbacks);
      pRenderPass: ptr RenderPass;
    ): Result {.preload("vkCreateRenderPass2"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
proc cmdBeginRenderPass2*(
      commandBuffer: CommandBuffer;
      pRenderPassBegin: ptr RenderPassBeginInfo;
      pSubpassBeginInfo: ptr SubpassBeginInfo;
    ): void {.preload("vkCmdBeginRenderPass2"),
      queues: QueueFlags{graphics},
      cmdbufferlevel: @[primary].}
proc cmdNextSubpass2*(
      commandBuffer: CommandBuffer;
      pSubpassBeginInfo: ptr SubpassBeginInfo;
      pSubpassEndInfo: ptr SubpassEndInfo;
    ): void {.preload("vkCmdNextSubpass2"),
      queues: QueueFlags{graphics},
      cmdbufferlevel: @[primary].}
proc cmdEndRenderPass2*(
      commandBuffer: CommandBuffer;
      pSubpassEndInfo: ptr SubpassEndInfo;
    ): void {.preload("vkCmdEndRenderPass2"),
      queues: QueueFlags{graphics},
      cmdbufferlevel: @[primary].}
# Promoted from VK_EXT_host_query_reset (extension 262)
proc resetQueryPool*(
      device: Device;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
    ): void {.preload("vkResetQueryPool").}
# Promoted from VK_KHR_timeline_semaphore (extension 208)
proc getSemaphoreCounterValue*(
      device: Device;
      semaphore: Semaphore;
      pValue: ptr uint64;
    ): Result {.preload("vkGetSemaphoreCounterValue"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost].}
proc waitSemaphores*(
      device: Device;
      pWaitInfo: ptr SemaphoreWaitInfo;
      timeout: uint64;
    ): Result {.preload("vkWaitSemaphores"),
      successCodes: @[Result.success, Result.timeout],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost].}
proc signalSemaphore*(
      device: Device;
      pSignalInfo: ptr SemaphoreSignalInfo;
    ): Result {.preload("vkSignalSemaphore"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
# Promoted from VK_KHR_buffer_device_address (extension 258)
proc getBufferDeviceAddress*(
      device: Device;
      pInfo: ptr BufferDeviceAddressInfo;
    ): DeviceAddress {.preload("vkGetBufferDeviceAddress").}
proc getBufferOpaqueCaptureAddress*(
      device: Device;
      pInfo: ptr BufferDeviceAddressInfo;
    ): uint64 {.preload("vkGetBufferOpaqueCaptureAddress").}
proc getDeviceMemoryOpaqueCaptureAddress*(
      device: Device;
      pInfo: ptr DeviceMemoryOpaqueCaptureAddressInfo;
    ): uint64 {.preload("vkGetDeviceMemoryOpaqueCaptureAddress").}

