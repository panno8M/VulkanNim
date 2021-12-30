# Generated at 2021-12-30T17:13:13Z
# VK_KHR_ray_tracing_pipeline

import ../platform

import ../features/vk10
import ./VK_KHR_spirv_1_4
import ./VK_KHR_acceleration_structure
export VK_KHR_spirv_1_4
export VK_KHR_acceleration_structure
prepareVulkanLibDef()

const
  KhrRayTracingPipelineSpecVersion* = 1
  KhrRayTracingPipelineExtensionName* = "VK_KHR_ray_tracing_pipeline"

type
  RayTracingShaderGroupCreateInfoKHR* = object
    sType* {.constant: (StructureType.rayTracingShaderGroupCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    theType*: RayTracingShaderGroupTypeKHR
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32
    pShaderGroupCaptureReplayHandle* {.optional.}: pointer
  RayTracingPipelineCreateInfoKHR* = object
    sType* {.constant: (StructureType.rayTracingPipelineCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCreateFlags
    stageCount* {.optional.}: uint32
    pStages* {.length: stageCount.}: arrPtr[PipelineShaderStageCreateInfo]
    groupCount* {.optional.}: uint32
    pGroups* {.length: groupCount.}: arrPtr[RayTracingShaderGroupCreateInfoKHR]
    maxPipelineRayRecursionDepth*: uint32
    pLibraryInfo* {.optional.}: ptr PipelineLibraryCreateInfoKHR
    pLibraryInterface* {.optional.}: ptr RayTracingPipelineInterfaceCreateInfoKHR
    pDynamicState* {.optional.}: ptr PipelineDynamicStateCreateInfo
    layout*: PipelineLayout
    basePipelineHandle* {.optional.}: Pipeline
    basePipelineIndex*: int32
  PhysicalDeviceRayTracingPipelineFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceRayTracingPipelineFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    rayTracingPipeline*: Bool32
    rayTracingPipelineShaderGroupHandleCaptureReplay*: Bool32
    rayTracingPipelineShaderGroupHandleCaptureReplayMixed*: Bool32
    rayTracingPipelineTraceRaysIndirect*: Bool32
    rayTraversalPrimitiveCulling*: Bool32
  PhysicalDeviceRayTracingPipelinePropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceRayTracingPipelinePropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderGroupHandleSize*: uint32
    maxRayRecursionDepth*: uint32
    maxShaderGroupStride*: uint32
    shaderGroupBaseAlignment*: uint32
    shaderGroupHandleCaptureReplaySize*: uint32
    maxRayDispatchInvocationCount*: uint32
    shaderGroupHandleAlignment*: uint32
    maxRayHitAttributeSize*: uint32
  StridedDeviceAddressRegionKHR* = object
    deviceAddress* {.optional.}: DeviceAddress
    stride*: DeviceSize
    size*: DeviceSize
  TraceRaysIndirectCommandKHR* = object
    width*: uint32
    height*: uint32
    depth*: uint32
  RayTracingPipelineInterfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.rayTracingPipelineInterfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    maxPipelineRayPayloadSize*: uint32
    maxPipelineRayHitAttributeSize*: uint32

proc cmdTraceRaysKHR*(
      commandBuffer: CommandBuffer;
      pRaygenShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pMissShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pHitShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pCallableShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      width: uint32;
      height: uint32;
      depth: uint32;
    ): void {.cdecl, lazyload("vkCmdTraceRaysKHR", DeviceLevel).}
proc createRayTracingPipelinesKHR*(
      device: Device;
      deferredOperation = default(DeferredOperationKHR);
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[RayTracingPipelineCreateInfoKHR];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.cdecl,
      successCodes(success, operationDeferredKhr, operationNotDeferredKhr, pipelineCompileRequiredExt),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidOpaqueCaptureAddress),
      lazyload("vkCreateRayTracingPipelinesKHR", DeviceLevel).}
proc getRayTracingShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetRayTracingShaderGroupHandlesKHR", DeviceLevel).}
proc getRayTracingCaptureReplayShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR", DeviceLevel).}
proc cmdTraceRaysIndirectKHR*(
      commandBuffer: CommandBuffer;
      pRaygenShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pMissShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pHitShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      pCallableShaderBindingTable: ptr StridedDeviceAddressRegionKHR;
      indirectDeviceAddress: DeviceAddress;
    ): void {.cdecl, lazyload("vkCmdTraceRaysIndirectKHR", DeviceLevel).}
proc getRayTracingShaderGroupStackSizeKHR*(
      device: Device;
      pipeline: Pipeline;
      group: uint32;
      groupShader: ShaderGroupShaderKHR;
    ): DeviceSize {.cdecl, lazyload("vkGetRayTracingShaderGroupStackSizeKHR", DeviceLevel).}
proc cmdSetRayTracingPipelineStackSizeKHR*(
      commandBuffer: CommandBuffer;
      pipelineStackSize: uint32;
    ): void {.cdecl, lazyload("vkCmdSetRayTracingPipelineStackSizeKHR", DeviceLevel).}

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
