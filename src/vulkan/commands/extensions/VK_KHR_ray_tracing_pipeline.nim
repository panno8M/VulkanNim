# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_KHR_ray_tracing_pipeline

import ../tools
const
  # VK_KHR_ray_tracing_pipeline
  KhrRayTracingPipelineSpecVersion* = 1
  KhrRayTracingPipelineExtensionName* = "VK_KHR_ray_tracing_pipeline"


# VK_KHR_ray_tracing_pipeline
# ===========================
proc cmdTraceRaysKHR*(
      commandBuffer: CommandBuffer;
      pRaygenShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pMissShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pHitShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pCallableShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      width: uint32;
      height: uint32;
      depth: uint32;
    ): void {.lazyload("vkCmdTraceRaysKHR", DeviceLevel),
      queues: QueueFlags{compute}, cmdchain.}
proc createRayTracingPipelinesKHR*(
      device: Device;
      deferredOperation = default(DeferredOperationKHR);
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[RayTracingPipelineCreateInfoKHR];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.lazyload("vkCreateRayTracingPipelinesKHR", DeviceLevel),
      successCodes: @[Result.success, Result.operationDeferredKhr, Result.operationNotDeferredKhr, Result.pipelineCompileRequiredExt],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidOpaqueCaptureAddress].}
proc getRayTracingShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
    ): Result {.lazyload("vkGetRayTracingShaderGroupHandlesKHR", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
proc getRayTracingCaptureReplayShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
    ): Result {.lazyload("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
proc cmdTraceRaysIndirectKHR*(
      commandBuffer: CommandBuffer;
      pRaygenShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pMissShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pHitShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pCallableShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      indirectDeviceAddress: DeviceAddress;
    ): void {.lazyload("vkCmdTraceRaysIndirectKHR", DeviceLevel),
      queues: QueueFlags{compute}, cmdchain.}
proc getRayTracingShaderGroupStackSizeKHR*(
      device: Device;
      pipeline: Pipeline;
      group: uint32;
      groupShader: ShaderGroupShaderKHR;
    ): DeviceSize {.lazyload("vkGetRayTracingShaderGroupStackSizeKHR", DeviceLevel).}
proc cmdSetRayTracingPipelineStackSizeKHR*(
      commandBuffer: CommandBuffer;
      pipelineStackSize: uint32;
    ): void {.lazyload("vkCmdSetRayTracingPipelineStackSizeKHR", DeviceLevel),
      queues: QueueFlags{compute}, cmdchain.}


proc loadAllVK_KHR_ray_tracing_pipeline*(instance: Instance) = instance.loadCommands:
  cmdTraceRaysKHR
  createRayTracingPipelinesKHR
  getRayTracingShaderGroupHandlesKHR
  getRayTracingCaptureReplayShaderGroupHandlesKHR
  cmdTraceRaysIndirectKHR
  getRayTracingShaderGroupStackSizeKHR
  cmdSetRayTracingPipelineStackSizeKHR
proc loadVK_KHR_ray_tracing_pipeline*(device: Device) = device.loadCommands:
  cmdTraceRaysKHR
  createRayTracingPipelinesKHR
  getRayTracingShaderGroupHandlesKHR
  getRayTracingCaptureReplayShaderGroupHandlesKHR
  cmdTraceRaysIndirectKHR
  getRayTracingShaderGroupStackSizeKHR
  cmdSetRayTracingPipelineStackSizeKHR