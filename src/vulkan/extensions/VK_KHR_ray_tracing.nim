# Generated at 2021-08-29T04:29:39Z
# VK_KHR_ray_tracing
# Explicit sort order to require processing after VK_NV_ray_tracing
# =================================================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_get_memory_requirements2
import VK_EXT_descriptor_indexing
import VK_KHR_buffer_device_address
import VK_KHR_deferred_host_operations
import VK_KHR_pipeline_library


const
  KhrRayTracingSpecVersion* = 8
  KhrRayTracingExtensionName* = "VK_KHR_ray_tracing"
  ShaderUnusedKhr* = (uint32.high)

type
  AccelerationStructureTypeKHR* {.size: sizeof(int32), pure.} = enum
    topLevelKhr = 0
    bottomLevelKhr = 1
  DeviceOrHostAddressKHR* {.union.} = object
    deviceAddress*: DeviceAddress
    hostAddress*: pointer
  DeviceOrHostAddressConstKHR* {.union.} = object
    deviceAddress*: DeviceAddress
    hostAddress*: pointer
  AccelerationStructureBuildOffsetInfoKHR* = object
    primitiveCount*: uint32
    primitiveOffset*: uint32
    firstVertex*: uint32
    transformOffset*: uint32
  RayTracingShaderGroupCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    theType*: RayTracingShaderGroupTypeKHR
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32
    pShaderGroupCaptureReplayHandle*: pointer
  RayTracingShaderGroupTypeKHR* {.size: sizeof(int32), pure.} = enum
    generalKhr = 0
    trianglesHitGroupKhr = 1
    proceduralHitGroupKhr = 2
  RayTracingPipelineCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCreateFlags
    stageCount*: uint32
    pStages*: ptr PipelineShaderStageCreateInfo
    groupCount*: uint32
    pGroups*: ptr RayTracingShaderGroupCreateInfoKHR
    maxRecursionDepth*: uint32
    libraries*: PipelineLibraryCreateInfoKHR
    pLibraryInterface*: ptr RayTracingPipelineInterfaceCreateInfoKHR
    layout*: PipelineLayout
    basePipelineHandle*: Pipeline
    basePipelineIndex*: int32
  AabbPositionsKHR* = object
    minX*: float32
    minY*: float32
    minZ*: float32
    maxX*: float32
    maxY*: float32
    maxZ*: float32
  AccelerationStructureGeometryTrianglesDataKHR* = object
    sType*: StructureType
    pNext*: pointer
    vertexFormat*: Format
    vertexData*: DeviceOrHostAddressConstKHR
    vertexStride*: DeviceSize
    indexType*: IndexType
    indexData*: DeviceOrHostAddressConstKHR
    transformData*: DeviceOrHostAddressConstKHR
  TransformMatrixKHR* = object
    matrix*: array[3, array[4, float32]]
  AccelerationStructureBuildGeometryInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    theType*: AccelerationStructureTypeKHR
    flags*: BuildAccelerationStructureFlagsKHR
    update*: Bool32
    srcAccelerationStructure*: AccelerationStructureKHR
    dstAccelerationStructure*: AccelerationStructureKHR
    geometryArrayOfPointers*: Bool32
    geometryCount*: uint32
    ppGeometries*: ptr ptr AccelerationStructureGeometryKHR
    scratchData*: DeviceOrHostAddressKHR
  AccelerationStructureBuildTypeKHR* {.size: sizeof(int32), pure.} = enum
    hostKhr = 0
    deviceKhr = 1
    hostOrDeviceKhr = 2
  AccelerationStructureGeometryAabbsDataKHR* = object
    sType*: StructureType
    pNext*: pointer
    data*: DeviceOrHostAddressConstKHR
    stride*: DeviceSize
  AccelerationStructureInstanceKHR* = object
    transform*: TransformMatrixKHR
    instanceCustomIndex*: uint32
    mask*: uint32
    instanceShaderBindingTableRecordOffset*: uint32
    flags*: GeometryInstanceFlagsKHR
    accelerationStructureReference*: uint64
  AccelerationStructureGeometryInstancesDataKHR* = object
    sType*: StructureType
    pNext*: pointer
    arrayOfPointers*: Bool32
    data*: DeviceOrHostAddressConstKHR
  AccelerationStructureGeometryDataKHR* {.union.} = object
    triangles*: AccelerationStructureGeometryTrianglesDataKHR
    aabbs*: AccelerationStructureGeometryAabbsDataKHR
    instances*: AccelerationStructureGeometryInstancesDataKHR
  AccelerationStructureGeometryKHR* = object
    sType*: StructureType
    pNext*: pointer
    geometryType*: GeometryTypeKHR
    geometry*: AccelerationStructureGeometryDataKHR
    flags*: GeometryFlagsKHR
  GeometryFlagsKHR* = Flags[GeometryFlagBitsKHR]
  GeometryInstanceFlagsKHR* = Flags[GeometryInstanceFlagBitsKHR]
  GeometryFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    opaqueKhr = 0x00000001
    noDuplicateAnyHitInvocationKhr = 0x00000002
  GeometryInstanceFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    triangleFacingCullDisableKhr = 0x00000001
    triangleFrontCounterclockwiseKhr = 0x00000002
    forceOpaqueKhr = 0x00000004
    forceNoOpaqueKhr = 0x00000008
  AccelerationStructureCreateGeometryTypeInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    geometryType*: GeometryTypeKHR
    maxPrimitiveCount*: uint32
    indexType*: IndexType
    maxVertexCount*: uint32
    vertexFormat*: Format
    allowsTransforms*: Bool32
  AccelerationStructureCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    compactedSize*: DeviceSize
    theType*: AccelerationStructureTypeKHR
    flags*: BuildAccelerationStructureFlagsKHR
    maxGeometryCount*: uint32
    pGeometryInfos*: ptr AccelerationStructureCreateGeometryTypeInfoKHR
    deviceAddress*: DeviceAddress
  AccelerationStructureKHR* = distinct NonDispatchableHandle
  BuildAccelerationStructureFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    allowUpdateKhr = 0x00000001
    allowCompactionKhr = 0x00000002
    preferFastTraceKhr = 0x00000004
    preferFastBuildKhr = 0x00000008
    lowMemoryKhr = 0x00000010
  BuildAccelerationStructureFlagsKHR* = Flags[BuildAccelerationStructureFlagBitsKHR]
  CopyAccelerationStructureModeKHR* {.size: sizeof(int32), pure.} = enum
    cloneKhr = 0
    compactKhr = 1
    serializeKhr = 2
    deserializeKhr = 3
  GeometryTypeKHR* {.size: sizeof(int32), pure.} = enum
    trianglesKhr = 0
    aabbsKhr = 1
    # Provided by VK_KHR_ray_tracing
    instancesKhr = 1000150000
  BindAccelerationStructureMemoryInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    accelerationStructure*: AccelerationStructureKHR
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32
  WriteDescriptorSetAccelerationStructureKHR* = object
    sType*: StructureType
    pNext*: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures*: ptr AccelerationStructureKHR
  AccelerationStructureMemoryRequirementsInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    theType*: AccelerationStructureMemoryRequirementsTypeKHR
    buildType*: AccelerationStructureBuildTypeKHR
    accelerationStructure*: AccelerationStructureKHR
  PhysicalDeviceRayTracingFeaturesKHR* = object
    sType*: StructureType
    pNext*: pointer
    rayTracing*: Bool32
    rayTracingShaderGroupHandleCaptureReplay*: Bool32
    rayTracingShaderGroupHandleCaptureReplayMixed*: Bool32
    rayTracingAccelerationStructureCaptureReplay*: Bool32
    rayTracingIndirectTraceRays*: Bool32
    rayTracingIndirectAccelerationStructureBuild*: Bool32
    rayTracingHostAccelerationStructureCommands*: Bool32
    rayQuery*: Bool32
    rayTracingPrimitiveCulling*: Bool32
  PhysicalDeviceRayTracingPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    shaderGroupHandleSize*: uint32
    maxRecursionDepth*: uint32
    maxShaderGroupStride*: uint32
    shaderGroupBaseAlignment*: uint32
    maxGeometryCount*: uint64
    maxInstanceCount*: uint64
    maxPrimitiveCount*: uint64
    maxDescriptorSetAccelerationStructures*: uint32
    shaderGroupHandleCaptureReplaySize*: uint32
  AccelerationStructureMemoryRequirementsTypeKHR* {.size: sizeof(int32), pure.} = enum
    objectKhr = 0
    buildScratchKhr = 1
    updateScratchKhr = 2
  AccelerationStructureDeviceAddressInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    accelerationStructure*: AccelerationStructureKHR
  AccelerationStructureVersionKHR* = object
    sType*: StructureType
    pNext*: pointer
    versionData*: ptr uint8
  StridedBufferRegionKHR* = object
    buffer*: Buffer
    offset*: DeviceSize
    stride*: DeviceSize
    size*: DeviceSize
  TraceRaysIndirectCommandKHR* = object
    width*: uint32
    height*: uint32
    depth*: uint32
  CopyAccelerationStructureToMemoryInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    src*: AccelerationStructureKHR
    dst*: DeviceOrHostAddressKHR
    mode*: CopyAccelerationStructureModeKHR
  CopyMemoryToAccelerationStructureInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    src*: DeviceOrHostAddressConstKHR
    dst*: AccelerationStructureKHR
    mode*: CopyAccelerationStructureModeKHR
  CopyAccelerationStructureInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    src*: AccelerationStructureKHR
    dst*: AccelerationStructureKHR
    mode*: CopyAccelerationStructureModeKHR
  RayTracingPipelineInterfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    maxPayloadSize*: uint32
    maxAttributeSize*: uint32
    maxCallableSize*: uint32

var # commands
  createAccelerationStructureKHRCage: proc(device: Device; pCreateInfo: ptr AccelerationStructureCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pAccelerationStructure: ptr AccelerationStructureKHR;): Result {.cdecl.}
  destroyAccelerationStructureKHRCage: proc(device: Device; accelerationStructure: AccelerationStructureKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getAccelerationStructureMemoryRequirementsKHRCage: proc(device: Device; pInfo: ptr AccelerationStructureMemoryRequirementsInfoKHR; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}
  bindAccelerationStructureMemoryKHRCage: proc(device: Device; bindInfoCount: uint32; pBindInfos: ptr BindAccelerationStructureMemoryInfoKHR;): Result {.cdecl.}
  cmdBuildAccelerationStructureKHRCage: proc(commandBuffer: CommandBuffer; infoCount: uint32; pInfos: ptr AccelerationStructureBuildGeometryInfoKHR; ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;): void {.cdecl.}
  cmdBuildAccelerationStructureIndirectKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr AccelerationStructureBuildGeometryInfoKHR; indirectBuffer: Buffer; indirectOffset: DeviceSize; indirectStride: uint32;): void {.cdecl.}
  buildAccelerationStructureKHRCage: proc(device: Device; infoCount: uint32; pInfos: ptr AccelerationStructureBuildGeometryInfoKHR; ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;): Result {.cdecl.}
  copyAccelerationStructureKHRCage: proc(device: Device; pInfo: ptr CopyAccelerationStructureInfoKHR;): Result {.cdecl.}
  copyAccelerationStructureToMemoryKHRCage: proc(device: Device; pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;): Result {.cdecl.}
  copyMemoryToAccelerationStructureKHRCage: proc(device: Device; pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;): Result {.cdecl.}
  writeAccelerationStructuresPropertiesKHRCage: proc(device: Device; accelerationStructureCount: uint32; pAccelerationStructures: ptr AccelerationStructureKHR; queryType: QueryType; dataSize: uint; pData: pointer; stride: uint;): Result {.cdecl.}
  cmdCopyAccelerationStructureKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr CopyAccelerationStructureInfoKHR;): void {.cdecl.}
  cmdCopyAccelerationStructureToMemoryKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;): void {.cdecl.}
  cmdCopyMemoryToAccelerationStructureKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;): void {.cdecl.}
  cmdTraceRaysKHRCage: proc(commandBuffer: CommandBuffer; pRaygenShaderBindingTable: ptr StridedBufferRegionKHR; pMissShaderBindingTable: ptr StridedBufferRegionKHR; pHitShaderBindingTable: ptr StridedBufferRegionKHR; pCallableShaderBindingTable: ptr StridedBufferRegionKHR; width: uint32; height: uint32; depth: uint32;): void {.cdecl.}
  createRayTracingPipelinesKHRCage: proc(device: Device; pipelineCache: PipelineCache; createInfoCount: uint32; pCreateInfos: ptr RayTracingPipelineCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pPipelines: ptr Pipeline;): Result {.cdecl.}
  getRayTracingShaderGroupHandlesKHRCage: proc(device: Device; pipeline: Pipeline; firstGroup: uint32; groupCount: uint32; dataSize: uint; pData: pointer;): Result {.cdecl.}
  getAccelerationStructureDeviceAddressKHRCage: proc(device: Device; pInfo: ptr AccelerationStructureDeviceAddressInfoKHR;): DeviceAddress {.cdecl.}
  getRayTracingCaptureReplayShaderGroupHandlesKHRCage: proc(device: Device; pipeline: Pipeline; firstGroup: uint32; groupCount: uint32; dataSize: uint; pData: pointer;): Result {.cdecl.}
  cmdWriteAccelerationStructuresPropertiesKHRCage: proc(commandBuffer: CommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr AccelerationStructureKHR; queryType: QueryType; queryPool: QueryPool; firstQuery: uint32;): void {.cdecl.}
  cmdTraceRaysIndirectKHRCage: proc(commandBuffer: CommandBuffer; pRaygenShaderBindingTable: ptr StridedBufferRegionKHR; pMissShaderBindingTable: ptr StridedBufferRegionKHR; pHitShaderBindingTable: ptr StridedBufferRegionKHR; pCallableShaderBindingTable: ptr StridedBufferRegionKHR; buffer: Buffer; offset: DeviceSize;): void {.cdecl.}
  getDeviceAccelerationStructureCompatibilityKHRCage: proc(device: Device; version: ptr AccelerationStructureVersionKHR;): Result {.cdecl.}
proc createAccelerationStructureKHR*(
      device: Device;
      pCreateInfo: ptr AccelerationStructureCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pAccelerationStructure: ptr AccelerationStructureKHR;
    ): Result {.cdecl, discardable.} =
  createAccelerationStructureKHRCage(device,pCreateInfo,pAllocator,pAccelerationStructure)
proc destroyAccelerationStructureKHR*(
      device: Device;
      accelerationStructure: AccelerationStructureKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyAccelerationStructureKHRCage(device,accelerationStructure,pAllocator)
proc getAccelerationStructureMemoryRequirementsKHR*(
      device: Device;
      pInfo: ptr AccelerationStructureMemoryRequirementsInfoKHR;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getAccelerationStructureMemoryRequirementsKHRCage(device,pInfo,pMemoryRequirements)
proc bindAccelerationStructureMemoryKHR*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos: ptr BindAccelerationStructureMemoryInfoKHR;
    ): Result {.cdecl, discardable.} =
  bindAccelerationStructureMemoryKHRCage(device,bindInfoCount,pBindInfos)
proc cmdBuildAccelerationStructureKHR*(
      commandBuffer: CommandBuffer;
      infoCount: uint32;
      pInfos: ptr AccelerationStructureBuildGeometryInfoKHR;
      ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;
    ): void {.cdecl.} =
  cmdBuildAccelerationStructureKHRCage(commandBuffer,infoCount,pInfos,ppOffsetInfos)
proc cmdBuildAccelerationStructureIndirectKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr AccelerationStructureBuildGeometryInfoKHR;
      indirectBuffer: Buffer;
      indirectOffset: DeviceSize;
      indirectStride: uint32;
    ): void {.cdecl.} =
  cmdBuildAccelerationStructureIndirectKHRCage(commandBuffer,pInfo,indirectBuffer,indirectOffset,indirectStride)
proc buildAccelerationStructureKHR*(
      device: Device;
      infoCount: uint32;
      pInfos: ptr AccelerationStructureBuildGeometryInfoKHR;
      ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;
    ): Result {.cdecl, discardable.} =
  buildAccelerationStructureKHRCage(device,infoCount,pInfos,ppOffsetInfos)
proc copyAccelerationStructureKHR*(
      device: Device;
      pInfo: ptr CopyAccelerationStructureInfoKHR;
    ): Result {.cdecl, discardable.} =
  copyAccelerationStructureKHRCage(device,pInfo)
proc copyAccelerationStructureToMemoryKHR*(
      device: Device;
      pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;
    ): Result {.cdecl, discardable.} =
  copyAccelerationStructureToMemoryKHRCage(device,pInfo)
proc copyMemoryToAccelerationStructureKHR*(
      device: Device;
      pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;
    ): Result {.cdecl, discardable.} =
  copyMemoryToAccelerationStructureKHRCage(device,pInfo)
proc writeAccelerationStructuresPropertiesKHR*(
      device: Device;
      accelerationStructureCount: uint32;
      pAccelerationStructures: ptr AccelerationStructureKHR;
      queryType: QueryType;
      dataSize: uint;
      pData: pointer;
      stride: uint;
    ): Result {.cdecl, discardable.} =
  writeAccelerationStructuresPropertiesKHRCage(device,accelerationStructureCount,pAccelerationStructures,queryType,dataSize,pData,stride)
proc cmdCopyAccelerationStructureKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr CopyAccelerationStructureInfoKHR;
    ): void {.cdecl.} =
  cmdCopyAccelerationStructureKHRCage(commandBuffer,pInfo)
proc cmdCopyAccelerationStructureToMemoryKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;
    ): void {.cdecl.} =
  cmdCopyAccelerationStructureToMemoryKHRCage(commandBuffer,pInfo)
proc cmdCopyMemoryToAccelerationStructureKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;
    ): void {.cdecl.} =
  cmdCopyMemoryToAccelerationStructureKHRCage(commandBuffer,pInfo)
proc cmdTraceRaysKHR*(
      commandBuffer: CommandBuffer;
      pRaygenShaderBindingTable: ptr StridedBufferRegionKHR;
      pMissShaderBindingTable: ptr StridedBufferRegionKHR;
      pHitShaderBindingTable: ptr StridedBufferRegionKHR;
      pCallableShaderBindingTable: ptr StridedBufferRegionKHR;
      width: uint32;
      height: uint32;
      depth: uint32;
    ): void {.cdecl.} =
  cmdTraceRaysKHRCage(commandBuffer,pRaygenShaderBindingTable,pMissShaderBindingTable,pHitShaderBindingTable,pCallableShaderBindingTable,width,height,depth)
proc createRayTracingPipelinesKHR*(
      device: Device;
      pipelineCache: PipelineCache;
      createInfoCount: uint32;
      pCreateInfos: ptr RayTracingPipelineCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pPipelines: ptr Pipeline;
    ): Result {.cdecl, discardable.} =
  createRayTracingPipelinesKHRCage(device,pipelineCache,createInfoCount,pCreateInfos,pAllocator,pPipelines)
proc getRayTracingShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData: pointer;
    ): Result {.cdecl, discardable.} =
  getRayTracingShaderGroupHandlesKHRCage(device,pipeline,firstGroup,groupCount,dataSize,pData)
proc getAccelerationStructureDeviceAddressKHR*(
      device: Device;
      pInfo: ptr AccelerationStructureDeviceAddressInfoKHR;
    ): DeviceAddress {.cdecl.} =
  getAccelerationStructureDeviceAddressKHRCage(device,pInfo)
proc getRayTracingCaptureReplayShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData: pointer;
    ): Result {.cdecl, discardable.} =
  getRayTracingCaptureReplayShaderGroupHandlesKHRCage(device,pipeline,firstGroup,groupCount,dataSize,pData)
proc cmdWriteAccelerationStructuresPropertiesKHR*(
      commandBuffer: CommandBuffer;
      accelerationStructureCount: uint32;
      pAccelerationStructures: ptr AccelerationStructureKHR;
      queryType: QueryType;
      queryPool: QueryPool;
      firstQuery: uint32;
    ): void {.cdecl.} =
  cmdWriteAccelerationStructuresPropertiesKHRCage(commandBuffer,accelerationStructureCount,pAccelerationStructures,queryType,queryPool,firstQuery)
proc cmdTraceRaysIndirectKHR*(
      commandBuffer: CommandBuffer;
      pRaygenShaderBindingTable: ptr StridedBufferRegionKHR;
      pMissShaderBindingTable: ptr StridedBufferRegionKHR;
      pHitShaderBindingTable: ptr StridedBufferRegionKHR;
      pCallableShaderBindingTable: ptr StridedBufferRegionKHR;
      buffer: Buffer;
      offset: DeviceSize;
    ): void {.cdecl.} =
  cmdTraceRaysIndirectKHRCage(commandBuffer,pRaygenShaderBindingTable,pMissShaderBindingTable,pHitShaderBindingTable,pCallableShaderBindingTable,buffer,offset)
proc getDeviceAccelerationStructureCompatibilityKHR*(
      device: Device;
      version: ptr AccelerationStructureVersionKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceAccelerationStructureCompatibilityKHRCage(device,version)
proc loadVK_KHR_ray_tracing*(instance: Instance) =
  instance.defineLoader(`<<`)

  createAccelerationStructureKHRCage << "vkCreateAccelerationStructureKHR"
  destroyAccelerationStructureKHRCage << "vkDestroyAccelerationStructureKHR"
  getAccelerationStructureMemoryRequirementsKHRCage << "vkGetAccelerationStructureMemoryRequirementsKHR"
  bindAccelerationStructureMemoryKHRCage << "vkBindAccelerationStructureMemoryKHR"
  cmdBuildAccelerationStructureKHRCage << "vkCmdBuildAccelerationStructureKHR"
  cmdBuildAccelerationStructureIndirectKHRCage << "vkCmdBuildAccelerationStructureIndirectKHR"
  buildAccelerationStructureKHRCage << "vkBuildAccelerationStructureKHR"
  copyAccelerationStructureKHRCage << "vkCopyAccelerationStructureKHR"
  copyAccelerationStructureToMemoryKHRCage << "vkCopyAccelerationStructureToMemoryKHR"
  copyMemoryToAccelerationStructureKHRCage << "vkCopyMemoryToAccelerationStructureKHR"
  writeAccelerationStructuresPropertiesKHRCage << "vkWriteAccelerationStructuresPropertiesKHR"
  cmdCopyAccelerationStructureKHRCage << "vkCmdCopyAccelerationStructureKHR"
  cmdCopyAccelerationStructureToMemoryKHRCage << "vkCmdCopyAccelerationStructureToMemoryKHR"
  cmdCopyMemoryToAccelerationStructureKHRCage << "vkCmdCopyMemoryToAccelerationStructureKHR"
  cmdTraceRaysKHRCage << "vkCmdTraceRaysKHR"
  createRayTracingPipelinesKHRCage << "vkCreateRayTracingPipelinesKHR"
  getRayTracingShaderGroupHandlesKHRCage << "vkGetRayTracingShaderGroupHandlesKHR"
  getAccelerationStructureDeviceAddressKHRCage << "vkGetAccelerationStructureDeviceAddressKHR"
  getRayTracingCaptureReplayShaderGroupHandlesKHRCage << "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"
  cmdWriteAccelerationStructuresPropertiesKHRCage << "vkCmdWriteAccelerationStructuresPropertiesKHR"
  cmdTraceRaysIndirectKHRCage << "vkCmdTraceRaysIndirectKHR"
  getDeviceAccelerationStructureCompatibilityKHRCage << "vkGetDeviceAccelerationStructureCompatibilityKHR"
