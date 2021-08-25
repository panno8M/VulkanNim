
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_get_memory_requirements2
import VK_EXT_descriptor_indexing
import VK_KHR_buffer_device_address
import VK_KHR_deferred_host_operations
import VK_KHR_pipeline_library


type
  AccelerationStructureBuildTypeKHR* {.size: sizeof(int32), pure.} = enum
    Host = 0
    Device = 1
    HostOrDevice = 2
  WriteDescriptorSetAccelerationStructureKHR* = object
    sType*: StructureType
    pNext*: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures*: ptr AccelerationStructureKHR
  AccelerationStructureCreateGeometryTypeInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    geometryType*: GeometryTypeKHR
    maxPrimitiveCount*: uint32
    indexType*: IndexType
    maxVertexCount*: uint32
    vertexFormat*: Format
    allowsTransforms*: Bool32
  StridedBufferRegionKHR* = object
    buffer*: Buffer
    offset*: DeviceSize
    stride*: DeviceSize
    size*: DeviceSize
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
  DeviceOrHostAddressConstKHR* {.union.} = object
    deviceAddress*: DeviceAddress
    hostAddress*: pointer
  AccelerationStructureInstanceKHR* = object
    transform*: TransformMatrixKHR
    instanceCustomIndex*: uint32
    mask*: uint32
    instanceShaderBindingTableRecordOffset*: uint32
    flags*: GeometryInstanceFlagsKHR
    accelerationStructureReference*: uint64
  TraceRaysIndirectCommandKHR* = object
    width*: uint32
    height*: uint32
    depth*: uint32
  DeviceOrHostAddressKHR* {.union.} = object
    deviceAddress*: DeviceAddress
    hostAddress*: pointer
  RayTracingShaderGroupTypeKHR* {.size: sizeof(int32), pure.} = enum
    General = 0
    TrianglesHitGroup = 1
    ProceduralHitGroup = 2
  CopyAccelerationStructureModeKHR* {.size: sizeof(int32), pure.} = enum
    Clone = 0
    Compact = 1
    Serialize = 2
    Deserialize = 3
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
  AccelerationStructureGeometryTrianglesDataKHR* = object
    sType*: StructureType
    pNext*: pointer
    vertexFormat*: Format
    vertexData*: DeviceOrHostAddressConstKHR
    vertexStride*: DeviceSize
    indexType*: IndexType
    indexData*: DeviceOrHostAddressConstKHR
    transformData*: DeviceOrHostAddressConstKHR
  GeometryFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    Opaque = 0x00000001
    NoDuplicateAnyHitInvocation = 0x00000002
  BindAccelerationStructureMemoryInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    accelerationStructure*: AccelerationStructureKHR
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32
  AccelerationStructureTypeKHR* {.size: sizeof(int32), pure.} = enum
    TopLevel = 0
    BottomLevel = 1
  GeometryInstanceFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    TriangleFacingCullDisable = 0x00000001
    TriangleFrontCounterclockwise = 0x00000002
    ForceOpaque = 0x00000004
    ForceNoOpaque = 0x00000008
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
  AccelerationStructureKHR* = distinct NonDispatchableHandle
  AccelerationStructureVersionKHR* = object
    sType*: StructureType
    pNext*: pointer
    versionData*: ptr uint8
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
  CopyMemoryToAccelerationStructureInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    src*: DeviceOrHostAddressConstKHR
    dst*: AccelerationStructureKHR
    mode*: CopyAccelerationStructureModeKHR
  AccelerationStructureDeviceAddressInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    accelerationStructure*: AccelerationStructureKHR
  CopyAccelerationStructureInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    src*: AccelerationStructureKHR
    dst*: AccelerationStructureKHR
    mode*: CopyAccelerationStructureModeKHR
  AccelerationStructureGeometryInstancesDataKHR* = object
    sType*: StructureType
    pNext*: pointer
    arrayOfPointers*: Bool32
    data*: DeviceOrHostAddressConstKHR
  AabbPositionsKHR* = object
    minX*: float32
    minY*: float32
    minZ*: float32
    maxX*: float32
    maxY*: float32
    maxZ*: float32
  AccelerationStructureMemoryRequirementsInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    theType*: AccelerationStructureMemoryRequirementsTypeKHR
    buildType*: AccelerationStructureBuildTypeKHR
    accelerationStructure*: AccelerationStructureKHR
  RayTracingPipelineInterfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    maxPayloadSize*: uint32
    maxAttributeSize*: uint32
    maxCallableSize*: uint32
  GeometryInstanceFlagsKHR* = distinct Flags
  TransformMatrixKHR* = object
    matrix*: array[3, array[4, float32]]
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
  AccelerationStructureGeometryAabbsDataKHR* = object
    sType*: StructureType
    pNext*: pointer
    data*: DeviceOrHostAddressConstKHR
    stride*: DeviceSize
  GeometryFlagsKHR* = distinct Flags
  BuildAccelerationStructureFlagsKHR* = distinct Flags
  AccelerationStructureMemoryRequirementsTypeKHR* {.size: sizeof(int32), pure.} = enum
    Object = 0
    BuildScratch = 1
    UpdateScratch = 2
  CopyAccelerationStructureToMemoryInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    src*: AccelerationStructureKHR
    dst*: DeviceOrHostAddressKHR
    mode*: CopyAccelerationStructureModeKHR
  AccelerationStructureCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    compactedSize*: DeviceSize
    theType*: AccelerationStructureTypeKHR
    flags*: BuildAccelerationStructureFlagsKHR
    maxGeometryCount*: uint32
    pGeometryInfos*: ptr AccelerationStructureCreateGeometryTypeInfoKHR
    deviceAddress*: DeviceAddress
  AccelerationStructureGeometryKHR* = object
    sType*: StructureType
    pNext*: pointer
    geometryType*: GeometryTypeKHR
    geometry*: AccelerationStructureGeometryDataKHR
    flags*: GeometryFlagsKHR
  AccelerationStructureGeometryDataKHR* {.union.} = object
    triangles*: AccelerationStructureGeometryTrianglesDataKHR
    aabbs*: AccelerationStructureGeometryAabbsDataKHR
    instances*: AccelerationStructureGeometryInstancesDataKHR
  BuildAccelerationStructureFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    AllowUpdate = 0x00000001
    AllowCompaction = 0x00000002
    PreferFastTrace = 0x00000004
    PreferFastBuild = 0x00000008
    LowMemory = 0x00000010
  GeometryTypeKHR* {.size: sizeof(int32), pure.} = enum
    Triangles = 0
    Aabbs = 1
    # Provided by VK_KHR_ray_tracing
    Instances = 100001500000

# Provided by VK_NV_ray_tracing
RayTracingShaderGroupTypeKHR.defineAlias(General, General)
# Provided by VK_NV_ray_tracing
RayTracingShaderGroupTypeKHR.defineAlias(TrianglesHitGroup, TrianglesHitGroup)
# Provided by VK_NV_ray_tracing
RayTracingShaderGroupTypeKHR.defineAlias(ProceduralHitGroup, ProceduralHitGroup)
# Provided by VK_NV_ray_tracing
CopyAccelerationStructureModeKHR.defineAlias(Clone, Clone)
# Provided by VK_NV_ray_tracing
CopyAccelerationStructureModeKHR.defineAlias(Compact, Compact)
# Provided by VK_NV_ray_tracing
GeometryFlagBitsKHR.defineAlias(Opaque, Opaque)
# Provided by VK_NV_ray_tracing
GeometryFlagBitsKHR.defineAlias(NoDuplicateAnyHitInvocation, NoDuplicateAnyHitInvocation)
# Provided by VK_NV_ray_tracing
AccelerationStructureTypeKHR.defineAlias(TopLevel, TopLevel)
# Provided by VK_NV_ray_tracing
AccelerationStructureTypeKHR.defineAlias(BottomLevel, BottomLevel)
# Provided by VK_NV_ray_tracing
GeometryInstanceFlagBitsKHR.defineAlias(TriangleCullDisable, TriangleFacingCullDisable)
# Provided by VK_NV_ray_tracing
GeometryInstanceFlagBitsKHR.defineAlias(TriangleFrontCounterclockwise, TriangleFrontCounterclockwise)
# Provided by VK_NV_ray_tracing
GeometryInstanceFlagBitsKHR.defineAlias(ForceOpaque, ForceOpaque)
# Provided by VK_NV_ray_tracing
GeometryInstanceFlagBitsKHR.defineAlias(ForceNoOpaque, ForceNoOpaque)
# Provided by VK_NV_ray_tracing
AccelerationStructureMemoryRequirementsTypeKHR.defineAlias(Object, Object)
# Provided by VK_NV_ray_tracing
AccelerationStructureMemoryRequirementsTypeKHR.defineAlias(BuildScratch, BuildScratch)
# Provided by VK_NV_ray_tracing
AccelerationStructureMemoryRequirementsTypeKHR.defineAlias(UpdateScratch, UpdateScratch)
# Provided by VK_NV_ray_tracing
BuildAccelerationStructureFlagBitsKHR.defineAlias(AllowUpdate, AllowUpdate)
# Provided by VK_NV_ray_tracing
BuildAccelerationStructureFlagBitsKHR.defineAlias(AllowCompaction, AllowCompaction)
# Provided by VK_NV_ray_tracing
BuildAccelerationStructureFlagBitsKHR.defineAlias(PreferFastTrace, PreferFastTrace)
# Provided by VK_NV_ray_tracing
BuildAccelerationStructureFlagBitsKHR.defineAlias(PreferFastBuild, PreferFastBuild)
# Provided by VK_NV_ray_tracing
BuildAccelerationStructureFlagBitsKHR.defineAlias(LowMemory, LowMemory)
# Provided by VK_NV_ray_tracing
GeometryTypeKHR.defineAlias(Triangles, Triangles)
# Provided by VK_NV_ray_tracing
GeometryTypeKHR.defineAlias(Aabbs, Aabbs)
const ShaderUnusedKhr* = (uint.high)
const KhrRayTracingExtensionName* = "VK_KHR_ray_tracing"
const KhrRayTracingSpecVersion* = 8
var # commands
  bindAccelerationStructureMemoryKHRCage: proc(device: Device; bindInfoCount: uint32; pBindInfos: ptr BindAccelerationStructureMemoryInfoKHR;): Result {.cdecl.}
  copyAccelerationStructureKHRCage: proc(device: Device; pInfo: ptr CopyAccelerationStructureInfoKHR;): Result {.cdecl.}
  getRayTracingCaptureReplayShaderGroupHandlesKHRCage: proc(device: Device; pipeline: Pipeline; firstGroup: uint32; groupCount: uint32; dataSize: uint; pData: pointer;): Result {.cdecl.}
  createRayTracingPipelinesKHRCage: proc(device: Device; pipelineCache: PipelineCache; createInfoCount: uint32; pCreateInfos: ptr RayTracingPipelineCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pPipelines: ptr Pipeline;): Result {.cdecl.}
  cmdBuildAccelerationStructureKHRCage: proc(commandBuffer: CommandBuffer; infoCount: uint32; pInfos: ptr AccelerationStructureBuildGeometryInfoKHR; ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;): void {.cdecl.}
  cmdCopyAccelerationStructureKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr CopyAccelerationStructureInfoKHR;): void {.cdecl.}
  getRayTracingShaderGroupHandlesKHRCage: proc(device: Device; pipeline: Pipeline; firstGroup: uint32; groupCount: uint32; dataSize: uint; pData: pointer;): Result {.cdecl.}
  cmdTraceRaysIndirectKHRCage: proc(commandBuffer: CommandBuffer; pRaygenShaderBindingTable: ptr StridedBufferRegionKHR; pMissShaderBindingTable: ptr StridedBufferRegionKHR; pHitShaderBindingTable: ptr StridedBufferRegionKHR; pCallableShaderBindingTable: ptr StridedBufferRegionKHR; buffer: Buffer; offset: DeviceSize;): void {.cdecl.}
  copyMemoryToAccelerationStructureKHRCage: proc(device: Device; pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;): Result {.cdecl.}
  copyAccelerationStructureToMemoryKHRCage: proc(device: Device; pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;): Result {.cdecl.}
  cmdCopyAccelerationStructureToMemoryKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;): void {.cdecl.}
  cmdCopyMemoryToAccelerationStructureKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;): void {.cdecl.}
  cmdTraceRaysKHRCage: proc(commandBuffer: CommandBuffer; pRaygenShaderBindingTable: ptr StridedBufferRegionKHR; pMissShaderBindingTable: ptr StridedBufferRegionKHR; pHitShaderBindingTable: ptr StridedBufferRegionKHR; pCallableShaderBindingTable: ptr StridedBufferRegionKHR; width: uint32; height: uint32; depth: uint32;): void {.cdecl.}
  writeAccelerationStructuresPropertiesKHRCage: proc(device: Device; accelerationStructureCount: uint32; pAccelerationStructures: ptr AccelerationStructureKHR; queryType: QueryType; dataSize: uint; pData: pointer; stride: uint;): Result {.cdecl.}
  getAccelerationStructureDeviceAddressKHRCage: proc(device: Device; pInfo: ptr AccelerationStructureDeviceAddressInfoKHR;): DeviceAddress {.cdecl.}
  createAccelerationStructureKHRCage: proc(device: Device; pCreateInfo: ptr AccelerationStructureCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pAccelerationStructure: ptr AccelerationStructureKHR;): Result {.cdecl.}
  destroyAccelerationStructureKHRCage: proc(device: Device; accelerationStructure: AccelerationStructureKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  buildAccelerationStructureKHRCage: proc(device: Device; infoCount: uint32; pInfos: ptr AccelerationStructureBuildGeometryInfoKHR; ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;): Result {.cdecl.}
  getDeviceAccelerationStructureCompatibilityKHRCage: proc(device: Device; version: ptr AccelerationStructureVersionKHR;): Result {.cdecl.}
  getAccelerationStructureMemoryRequirementsKHRCage: proc(device: Device; pInfo: ptr AccelerationStructureMemoryRequirementsInfoKHR; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}
  cmdWriteAccelerationStructuresPropertiesKHRCage: proc(commandBuffer: CommandBuffer; accelerationStructureCount: uint32; pAccelerationStructures: ptr AccelerationStructureKHR; queryType: QueryType; queryPool: QueryPool; firstQuery: uint32;): void {.cdecl.}
  cmdBuildAccelerationStructureIndirectKHRCage: proc(commandBuffer: CommandBuffer; pInfo: ptr AccelerationStructureBuildGeometryInfoKHR; indirectBuffer: Buffer; indirectOffset: DeviceSize; indirectStride: uint32;): void {.cdecl.}

proc bindAccelerationStructureMemoryKHR*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos: ptr BindAccelerationStructureMemoryInfoKHR;
    ): Result {.cdecl, discardable.} =
  bindAccelerationStructureMemoryKHRCage(device,bindInfoCount,pBindInfos)

proc copyAccelerationStructureKHR*(
      device: Device;
      pInfo: ptr CopyAccelerationStructureInfoKHR;
    ): Result {.cdecl, discardable.} =
  copyAccelerationStructureKHRCage(device,pInfo)

proc getRayTracingCaptureReplayShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData: pointer;
    ): Result {.cdecl, discardable.} =
  getRayTracingCaptureReplayShaderGroupHandlesKHRCage(device,pipeline,firstGroup,groupCount,dataSize,pData)

proc createRayTracingPipelinesKHR*(
      device: Device;
      pipelineCache: PipelineCache;
      createInfoCount: uint32;
      pCreateInfos: ptr RayTracingPipelineCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pPipelines: ptr Pipeline;
    ): Result {.cdecl, discardable.} =
  createRayTracingPipelinesKHRCage(device,pipelineCache,createInfoCount,pCreateInfos,pAllocator,pPipelines)

proc cmdBuildAccelerationStructureKHR*(
      commandBuffer: CommandBuffer;
      infoCount: uint32;
      pInfos: ptr AccelerationStructureBuildGeometryInfoKHR;
      ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;
    ): void {.cdecl.} =
  cmdBuildAccelerationStructureKHRCage(commandBuffer,infoCount,pInfos,ppOffsetInfos)

proc cmdCopyAccelerationStructureKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr CopyAccelerationStructureInfoKHR;
    ): void {.cdecl.} =
  cmdCopyAccelerationStructureKHRCage(commandBuffer,pInfo)

proc getRayTracingShaderGroupHandlesKHR*(
      device: Device;
      pipeline: Pipeline;
      firstGroup: uint32;
      groupCount: uint32;
      dataSize: uint;
      pData: pointer;
    ): Result {.cdecl, discardable.} =
  getRayTracingShaderGroupHandlesKHRCage(device,pipeline,firstGroup,groupCount,dataSize,pData)

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

proc copyMemoryToAccelerationStructureKHR*(
      device: Device;
      pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;
    ): Result {.cdecl, discardable.} =
  copyMemoryToAccelerationStructureKHRCage(device,pInfo)

proc copyAccelerationStructureToMemoryKHR*(
      device: Device;
      pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;
    ): Result {.cdecl, discardable.} =
  copyAccelerationStructureToMemoryKHRCage(device,pInfo)

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

proc getAccelerationStructureDeviceAddressKHR*(
      device: Device;
      pInfo: ptr AccelerationStructureDeviceAddressInfoKHR;
    ): DeviceAddress {.cdecl.} =
  getAccelerationStructureDeviceAddressKHRCage(device,pInfo)

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

proc buildAccelerationStructureKHR*(
      device: Device;
      infoCount: uint32;
      pInfos: ptr AccelerationStructureBuildGeometryInfoKHR;
      ppOffsetInfos: ptr ptr AccelerationStructureBuildOffsetInfoKHR;
    ): Result {.cdecl, discardable.} =
  buildAccelerationStructureKHRCage(device,infoCount,pInfos,ppOffsetInfos)

proc getDeviceAccelerationStructureCompatibilityKHR*(
      device: Device;
      version: ptr AccelerationStructureVersionKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceAccelerationStructureCompatibilityKHRCage(device,version)

proc getAccelerationStructureMemoryRequirementsKHR*(
      device: Device;
      pInfo: ptr AccelerationStructureMemoryRequirementsInfoKHR;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getAccelerationStructureMemoryRequirementsKHRCage(device,pInfo,pMemoryRequirements)

proc cmdWriteAccelerationStructuresPropertiesKHR*(
      commandBuffer: CommandBuffer;
      accelerationStructureCount: uint32;
      pAccelerationStructures: ptr AccelerationStructureKHR;
      queryType: QueryType;
      queryPool: QueryPool;
      firstQuery: uint32;
    ): void {.cdecl.} =
  cmdWriteAccelerationStructuresPropertiesKHRCage(commandBuffer,accelerationStructureCount,pAccelerationStructures,queryType,queryPool,firstQuery)

proc cmdBuildAccelerationStructureIndirectKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr AccelerationStructureBuildGeometryInfoKHR;
      indirectBuffer: Buffer;
      indirectOffset: DeviceSize;
      indirectStride: uint32;
    ): void {.cdecl.} =
  cmdBuildAccelerationStructureIndirectKHRCage(commandBuffer,pInfo,indirectBuffer,indirectOffset,indirectStride)


proc loadVK_KHR_ray_tracing*(instance: Instance) =
  instance.defineLoader(`<<`)

  bindAccelerationStructureMemoryKHRCage << "vkBindAccelerationStructureMemoryKHR"
  copyAccelerationStructureKHRCage << "vkCopyAccelerationStructureKHR"
  getRayTracingCaptureReplayShaderGroupHandlesKHRCage << "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"
  createRayTracingPipelinesKHRCage << "vkCreateRayTracingPipelinesKHR"
  cmdBuildAccelerationStructureKHRCage << "vkCmdBuildAccelerationStructureKHR"
  cmdCopyAccelerationStructureKHRCage << "vkCmdCopyAccelerationStructureKHR"
  getRayTracingShaderGroupHandlesKHRCage << "vkGetRayTracingShaderGroupHandlesKHR"
  cmdTraceRaysIndirectKHRCage << "vkCmdTraceRaysIndirectKHR"
  copyMemoryToAccelerationStructureKHRCage << "vkCopyMemoryToAccelerationStructureKHR"
  copyAccelerationStructureToMemoryKHRCage << "vkCopyAccelerationStructureToMemoryKHR"
  cmdCopyAccelerationStructureToMemoryKHRCage << "vkCmdCopyAccelerationStructureToMemoryKHR"
  cmdCopyMemoryToAccelerationStructureKHRCage << "vkCmdCopyMemoryToAccelerationStructureKHR"
  cmdTraceRaysKHRCage << "vkCmdTraceRaysKHR"
  writeAccelerationStructuresPropertiesKHRCage << "vkWriteAccelerationStructuresPropertiesKHR"
  getAccelerationStructureDeviceAddressKHRCage << "vkGetAccelerationStructureDeviceAddressKHR"
  createAccelerationStructureKHRCage << "vkCreateAccelerationStructureKHR"
  destroyAccelerationStructureKHRCage << "vkDestroyAccelerationStructureKHR"
  buildAccelerationStructureKHRCage << "vkBuildAccelerationStructureKHR"
  getDeviceAccelerationStructureCompatibilityKHRCage << "vkGetDeviceAccelerationStructureCompatibilityKHR"
  getAccelerationStructureMemoryRequirementsKHRCage << "vkGetAccelerationStructureMemoryRequirementsKHR"
  cmdWriteAccelerationStructuresPropertiesKHRCage << "vkCmdWriteAccelerationStructuresPropertiesKHR"
  cmdBuildAccelerationStructureIndirectKHRCage << "vkCmdBuildAccelerationStructureIndirectKHR"