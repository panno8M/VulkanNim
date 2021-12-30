# Generated at 2021-12-30T17:13:13Z
# VK_NV_ray_tracing

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_get_memory_requirements2
export VK_KHR_get_physical_device_properties2
export VK_KHR_get_memory_requirements2
prepareVulkanLibDef()

const
  NvRayTracingSpecVersion* = 3
  NvRayTracingExtensionName* = "VK_NV_ray_tracing"

type
  RayTracingShaderGroupCreateInfoNV* = object
    sType* {.constant: (StructureType.rayTracingShaderGroupCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    theType*: RayTracingShaderGroupTypeKHR
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32
  RayTracingPipelineCreateInfoNV* = object
    sType* {.constant: (StructureType.rayTracingPipelineCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCreateFlags
    stageCount*: uint32
    pStages* {.length: stageCount.}: arrPtr[PipelineShaderStageCreateInfo]
    groupCount*: uint32
    pGroups* {.length: groupCount.}: arrPtr[RayTracingShaderGroupCreateInfoNV]
    maxRecursionDepth*: uint32
    layout*: PipelineLayout
    basePipelineHandle* {.optional.}: Pipeline
    basePipelineIndex*: int32
  GeometryTrianglesNV* = object
    sType* {.constant: (StructureType.geometryTrianglesNv).}: StructureType
    pNext* {.optional.}: pointer
    vertexData* {.optional.}: Buffer
    vertexOffset*: DeviceSize
    vertexCount*: uint32
    vertexStride*: DeviceSize
    vertexFormat*: Format
    indexData* {.optional.}: Buffer
    indexOffset*: DeviceSize
    indexCount*: uint32
    indexType*: IndexType
    transformData* {.optional.}: Buffer
    transformOffset*: DeviceSize
  GeometryAABBNV* = object
    sType* {.constant: (StructureType.geometryAabbNv).}: StructureType
    pNext* {.optional.}: pointer
    aabbData* {.optional.}: Buffer
    numAABBs*: uint32
    stride*: uint32
    offset*: DeviceSize
  GeometryDataNV* = object
    triangles*: GeometryTrianglesNV
    aabbs*: GeometryAABBNV
  GeometryNV* = object
    sType* {.constant: (StructureType.geometryNv).}: StructureType
    pNext* {.optional.}: pointer
    geometryType*: GeometryTypeKHR
    geometry*: GeometryDataNV
    flags* {.optional.}: GeometryFlagsKHR
  AccelerationStructureInfoNV* = object
    sType* {.constant: (StructureType.accelerationStructureInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    theType*: AccelerationStructureTypeNV
    flags* {.optional.}: BuildAccelerationStructureFlagsNV
    instanceCount* {.optional.}: uint32
    geometryCount* {.optional.}: uint32
    pGeometries* {.length: geometryCount.}: arrPtr[GeometryNV]
  AccelerationStructureCreateInfoNV* = object
    sType* {.constant: (StructureType.accelerationStructureCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    compactedSize*: DeviceSize
    info*: AccelerationStructureInfoNV
  BindAccelerationStructureMemoryInfoNV* = object
    sType* {.constant: (StructureType.bindAccelerationStructureMemoryInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    accelerationStructure*: AccelerationStructureNV
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    deviceIndexCount* {.optional.}: uint32
    pDeviceIndices* {.length: deviceIndexCount.}: arrPtr[uint32]
  WriteDescriptorSetAccelerationStructureNV* = object
    sType* {.constant: (StructureType.writeDescriptorSetAccelerationStructureNv).}: StructureType
    pNext* {.optional.}: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures* {.length: accelerationStructureCount.}: arrPtr[AccelerationStructureNV]
  AccelerationStructureMemoryRequirementsInfoNV* = object
    sType* {.constant: (StructureType.accelerationStructureMemoryRequirementsInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    theType*: AccelerationStructureMemoryRequirementsTypeNV
    accelerationStructure*: AccelerationStructureNV
  PhysicalDeviceRayTracingPropertiesNV* = object
    sType* {.constant: (StructureType.physicalDeviceRayTracingPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    shaderGroupHandleSize*: uint32
    maxRecursionDepth*: uint32
    maxShaderGroupStride*: uint32
    shaderGroupBaseAlignment*: uint32
    maxGeometryCount*: uint64
    maxInstanceCount*: uint64
    maxTriangleCount*: uint64
    maxDescriptorSetAccelerationStructures*: uint32
  MemoryRequirements2KHR* = object
  TransformMatrixNV* = object
  AabbPositionsNV* = object
  AccelerationStructureInstanceNV* = object

proc createAccelerationStructureNV*(
      device: Device;
      pCreateInfo: ptr AccelerationStructureCreateInfoNV;
      pAllocator = default(ptr AllocationCallbacks);
      pAccelerationStructure: ptr AccelerationStructureNV;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkCreateAccelerationStructureNV", DeviceLevel).}
proc destroyAccelerationStructureNV*(
      device: Device;
      accelerationStructure = default(AccelerationStructureNV);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyAccelerationStructureNV", DeviceLevel).}
proc getAccelerationStructureMemoryRequirementsNV*(
      device: Device;
      pInfo: ptr AccelerationStructureMemoryRequirementsInfoNV;
      pMemoryRequirements: ptr MemoryRequirements2KHR;
    ): void {.cdecl, lazyload("vkGetAccelerationStructureMemoryRequirementsNV", DeviceLevel).}
proc bindAccelerationStructureMemoryNV*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos {.length: bindInfoCount.}: arrPtr[BindAccelerationStructureMemoryInfoNV];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkBindAccelerationStructureMemoryNV", DeviceLevel).}
proc cmdBuildAccelerationStructureNV*(
      commandBuffer: CommandBuffer;
      pInfo: ptr AccelerationStructureInfoNV;
      instanceData = default(Buffer);
      instanceOffset: DeviceSize;
      update: Bool32;
      dst: AccelerationStructureNV;
      src = default(AccelerationStructureNV);
      scratch: Buffer;
      scratchOffset: DeviceSize;
    ): void {.cdecl, lazyload("vkCmdBuildAccelerationStructureNV", DeviceLevel).}
proc cmdCopyAccelerationStructureNV*(
      commandBuffer: CommandBuffer;
      dst: AccelerationStructureNV;
      src: AccelerationStructureNV;
      mode: CopyAccelerationStructureModeKHR;
    ): void {.cdecl, lazyload("vkCmdCopyAccelerationStructureNV", DeviceLevel).}
proc cmdTraceRaysNV*(
      commandBuffer: CommandBuffer;
      raygenShaderBindingTableBuffer: Buffer;
      raygenShaderBindingOffset: DeviceSize;
      missShaderBindingTableBuffer = default(Buffer);
      missShaderBindingOffset: DeviceSize;
      missShaderBindingStride: DeviceSize;
      hitShaderBindingTableBuffer = default(Buffer);
      hitShaderBindingOffset: DeviceSize;
      hitShaderBindingStride: DeviceSize;
      callableShaderBindingTableBuffer = default(Buffer);
      callableShaderBindingOffset: DeviceSize;
      callableShaderBindingStride: DeviceSize;
      width: uint32;
      height: uint32;
      depth: uint32;
    ): void {.cdecl, lazyload("vkCmdTraceRaysNV", DeviceLevel).}
proc createRayTracingPipelinesNV*(
      device: Device;
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[RayTracingPipelineCreateInfoNV];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.cdecl,
      successCodes(success, pipelineCompileRequiredExt),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidShaderNv),
      lazyload("vkCreateRayTracingPipelinesNV", DeviceLevel).}
const getRayTracingShaderGroupHandlesNV* = getRayTracingShaderGroupHandlesKHR
proc getAccelerationStructureHandleNV*(
      device: Device;
      accelerationStructure: AccelerationStructureNV;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetAccelerationStructureHandleNV", DeviceLevel).}
proc cmdWriteAccelerationStructuresPropertiesNV*(
      commandBuffer: CommandBuffer;
      accelerationStructureCount: uint32;
      pAccelerationStructures {.length: accelerationStructureCount.}: arrPtr[AccelerationStructureNV];
      queryType: QueryType;
      queryPool: QueryPool;
      firstQuery: uint32;
    ): void {.cdecl, lazyload("vkCmdWriteAccelerationStructuresPropertiesNV", DeviceLevel).}
proc compileDeferredNV*(
      device: Device;
      pipeline: Pipeline;
      shader: uint32;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkCompileDeferredNV", DeviceLevel).}

proc loadAllVK_NV_ray_tracing*(instance: Instance) = instance.loadCommands:
  createAccelerationStructureNV
  destroyAccelerationStructureNV
  getAccelerationStructureMemoryRequirementsNV
  bindAccelerationStructureMemoryNV
  cmdBuildAccelerationStructureNV
  cmdCopyAccelerationStructureNV
  cmdTraceRaysNV
  createRayTracingPipelinesNV
  getAccelerationStructureHandleNV
  cmdWriteAccelerationStructuresPropertiesNV
  compileDeferredNV
proc loadVK_NV_ray_tracing*(device: Device) = device.loadCommands:
  createAccelerationStructureNV
  destroyAccelerationStructureNV
  getAccelerationStructureMemoryRequirementsNV
  bindAccelerationStructureMemoryNV
  cmdBuildAccelerationStructureNV
  cmdCopyAccelerationStructureNV
  cmdTraceRaysNV
  createRayTracingPipelinesNV
  getAccelerationStructureHandleNV
  cmdWriteAccelerationStructuresPropertiesNV
  compileDeferredNV
