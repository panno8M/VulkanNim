
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_get_memory_requirements2


type
  GeometryNV* = object
    sType*: StructureType
    pNext*: pointer
    geometryType*: GeometryTypeKHR
    geometry*: GeometryDataNV
    flags*: GeometryFlagsKHR
  AccelerationStructureInstanceNV* = object
  TransformMatrixNV* = object
  BuildAccelerationStructureFlagBitsNV* = UnusedEnum
  AccelerationStructureMemoryRequirementsInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    theType*: AccelerationStructureMemoryRequirementsTypeNV
    accelerationStructure*: AccelerationStructureNV
  CopyAccelerationStructureModeNV* = UnusedEnum
  BindAccelerationStructureMemoryInfoNV* = object
  GeometryAABBNV* = object
    sType*: StructureType
    pNext*: pointer
    aabbData*: Buffer
    numAABBs*: uint32
    stride*: uint32
    offset*: DeviceSize
  RayTracingShaderGroupTypeNV* = UnusedEnum
  {name}* = {Alias}
  RayTracingPipelineCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCreateFlags
    stageCount*: uint32
    pStages*: ptr PipelineShaderStageCreateInfo
    groupCount*: uint32
    pGroups*: ptr RayTracingShaderGroupCreateInfoNV
    maxRecursionDepth*: uint32
    layout*: PipelineLayout
    basePipelineHandle*: Pipeline
    basePipelineIndex*: int32
  RayTracingShaderGroupCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    theType*: RayTracingShaderGroupTypeKHR
    generalShader*: uint32
    closestHitShader*: uint32
    anyHitShader*: uint32
    intersectionShader*: uint32
  AccelerationStructureTypeNV* = UnusedEnum
  {name}* = {Alias}
  GeometryInstanceFlagBitsNV* = UnusedEnum
  AccelerationStructureInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    theType*: AccelerationStructureTypeNV
    flags*: BuildAccelerationStructureFlagsNV
    instanceCount*: uint32
    geometryCount*: uint32
    pGeometries*: ptr GeometryNV
  MemoryRequirements2KHR* = object
  GeometryTypeNV* = UnusedEnum
  PhysicalDeviceRayTracingPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    shaderGroupHandleSize*: uint32
    maxRecursionDepth*: uint32
    maxShaderGroupStride*: uint32
    shaderGroupBaseAlignment*: uint32
    maxGeometryCount*: uint64
    maxInstanceCount*: uint64
    maxTriangleCount*: uint64
    maxDescriptorSetAccelerationStructures*: uint32
  GeometryDataNV* = object
    triangles*: GeometryTrianglesNV
    aabbs*: GeometryAABBNV
  AccelerationStructureMemoryRequirementsTypeNV* = UnusedEnum
  {name}* = {Alias}
  # TODO: [Unsupported Type]
  # (name: "VkAccelerationStructureNV", kind: nkrType)
  AccelerationStructureCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    compactedSize*: DeviceSize
    info*: AccelerationStructureInfoNV
  AabbPositionsNV* = object
  WriteDescriptorSetAccelerationStructureNV* = object
  GeometryFlagBitsNV* = UnusedEnum
  GeometryTrianglesNV* = object
    sType*: StructureType
    pNext*: pointer
    vertexData*: Buffer
    vertexOffset*: DeviceSize
    vertexCount*: uint32
    vertexStride*: DeviceSize
    vertexFormat*: Format
    indexData*: Buffer
    indexOffset*: DeviceSize
    indexCount*: uint32
    indexType*: IndexType
    transformData*: Buffer
    transformOffset*: DeviceSize

const NvRayTracingSpecVersion* = 3
const NvRayTracingExtensionName* = "VK_NV_ray_tracing"
template ShaderUnusedNv*(): untyped =
  VkShaderUnusedKhr
var # commands
  createAccelerationStructureNVCage: proc(device: Device; pCreateInfo: ptr AccelerationStructureCreateInfoNV; pAllocator: ptr AllocationCallbacks; pAccelerationStructure: ptr AccelerationStructureNV;): Result {.cdecl.}
  getAccelerationStructureHandleNVCage: proc(device: Device; accelerationStructure: AccelerationStructureKHR; dataSize: uint; pData: pointer;): Result {.cdecl.}
  getAccelerationStructureMemoryRequirementsNVCage: proc(device: Device; pInfo: ptr AccelerationStructureMemoryRequirementsInfoNV; pMemoryRequirements: ptr MemoryRequirements2KHR;): void {.cdecl.}
  compileDeferredNVCage: proc(device: Device; pipeline: Pipeline; shader: uint32;): Result {.cdecl.}
  
  cmdBuildAccelerationStructureNVCage: proc(commandBuffer: CommandBuffer; pInfo: ptr AccelerationStructureInfoNV; instanceData: Buffer; instanceOffset: DeviceSize; update: Bool32; dst: AccelerationStructureKHR; src: AccelerationStructureKHR; scratch: Buffer; scratchOffset: DeviceSize;): void {.cdecl.}
  
  cmdTraceRaysNVCage: proc(commandBuffer: CommandBuffer; raygenShaderBindingTableBuffer: Buffer; raygenShaderBindingOffset: DeviceSize; missShaderBindingTableBuffer: Buffer; missShaderBindingOffset: DeviceSize; missShaderBindingStride: DeviceSize; hitShaderBindingTableBuffer: Buffer; hitShaderBindingOffset: DeviceSize; hitShaderBindingStride: DeviceSize; callableShaderBindingTableBuffer: Buffer; callableShaderBindingOffset: DeviceSize; callableShaderBindingStride: DeviceSize; width: uint32; height: uint32; depth: uint32;): void {.cdecl.}
  cmdCopyAccelerationStructureNVCage: proc(commandBuffer: CommandBuffer; dst: AccelerationStructureKHR; src: AccelerationStructureKHR; mode: CopyAccelerationStructureModeKHR;): void {.cdecl.}
  createRayTracingPipelinesNVCage: proc(device: Device; pipelineCache: PipelineCache; createInfoCount: uint32; pCreateInfos: ptr RayTracingPipelineCreateInfoNV; pAllocator: ptr AllocationCallbacks; pPipelines: ptr Pipeline;): Result {.cdecl.}
  
  

proc createAccelerationStructureNV*(
      device: Device;
      pCreateInfo: ptr AccelerationStructureCreateInfoNV;
      pAllocator: ptr AllocationCallbacks;
      pAccelerationStructure: ptr AccelerationStructureNV;
    ): Result {.cdecl, discardable.} =
  createAccelerationStructureNVCage(device,pCreateInfo,pAllocator,pAccelerationStructure)

proc getAccelerationStructureHandleNV*(
      device: Device;
      accelerationStructure: AccelerationStructureKHR;
      dataSize: uint;
      pData: pointer;
    ): Result {.cdecl, discardable.} =
  getAccelerationStructureHandleNVCage(device,accelerationStructure,dataSize,pData)

proc getAccelerationStructureMemoryRequirementsNV*(
      device: Device;
      pInfo: ptr AccelerationStructureMemoryRequirementsInfoNV;
      pMemoryRequirements: ptr MemoryRequirements2KHR;
    ): void {.cdecl.} =
  getAccelerationStructureMemoryRequirementsNVCage(device,pInfo,pMemoryRequirements)

proc compileDeferredNV*(
      device: Device;
      pipeline: Pipeline;
      shader: uint32;
    ): Result {.cdecl, discardable.} =
  compileDeferredNVCage(device,pipeline,shader)

const getRayTracingShaderGroupHandlesNV* = getRayTracingShaderGroupHandlesKHR

proc cmdBuildAccelerationStructureNV*(
      commandBuffer: CommandBuffer;
      pInfo: ptr AccelerationStructureInfoNV;
      instanceData: Buffer;
      instanceOffset: DeviceSize;
      update: Bool32;
      dst: AccelerationStructureKHR;
      src: AccelerationStructureKHR;
      scratch: Buffer;
      scratchOffset: DeviceSize;
    ): void {.cdecl.} =
  cmdBuildAccelerationStructureNVCage(commandBuffer,pInfo,instanceData,instanceOffset,update,dst,src,scratch,scratchOffset)

const destroyAccelerationStructureNV* = destroyAccelerationStructureKHR

proc cmdTraceRaysNV*(
      commandBuffer: CommandBuffer;
      raygenShaderBindingTableBuffer: Buffer;
      raygenShaderBindingOffset: DeviceSize;
      missShaderBindingTableBuffer: Buffer;
      missShaderBindingOffset: DeviceSize;
      missShaderBindingStride: DeviceSize;
      hitShaderBindingTableBuffer: Buffer;
      hitShaderBindingOffset: DeviceSize;
      hitShaderBindingStride: DeviceSize;
      callableShaderBindingTableBuffer: Buffer;
      callableShaderBindingOffset: DeviceSize;
      callableShaderBindingStride: DeviceSize;
      width: uint32;
      height: uint32;
      depth: uint32;
    ): void {.cdecl.} =
  cmdTraceRaysNVCage(commandBuffer,raygenShaderBindingTableBuffer,raygenShaderBindingOffset,missShaderBindingTableBuffer,missShaderBindingOffset,missShaderBindingStride,hitShaderBindingTableBuffer,hitShaderBindingOffset,hitShaderBindingStride,callableShaderBindingTableBuffer,callableShaderBindingOffset,callableShaderBindingStride,width,height,depth)

proc cmdCopyAccelerationStructureNV*(
      commandBuffer: CommandBuffer;
      dst: AccelerationStructureKHR;
      src: AccelerationStructureKHR;
      mode: CopyAccelerationStructureModeKHR;
    ): void {.cdecl.} =
  cmdCopyAccelerationStructureNVCage(commandBuffer,dst,src,mode)

proc createRayTracingPipelinesNV*(
      device: Device;
      pipelineCache: PipelineCache;
      createInfoCount: uint32;
      pCreateInfos: ptr RayTracingPipelineCreateInfoNV;
      pAllocator: ptr AllocationCallbacks;
      pPipelines: ptr Pipeline;
    ): Result {.cdecl, discardable.} =
  createRayTracingPipelinesNVCage(device,pipelineCache,createInfoCount,pCreateInfos,pAllocator,pPipelines)

const bindAccelerationStructureMemoryNV* = bindAccelerationStructureMemoryKHR

const cmdWriteAccelerationStructuresPropertiesNV* = cmdWriteAccelerationStructuresPropertiesKHR


proc loadVK_NV_ray_tracing*(instance: Instance) =
  instance.defineLoader(`<<`)

  createAccelerationStructureNVCage << "vkCreateAccelerationStructureNV"
  getAccelerationStructureHandleNVCage << "vkGetAccelerationStructureHandleNV"
  getAccelerationStructureMemoryRequirementsNVCage << "vkGetAccelerationStructureMemoryRequirementsNV"
  compileDeferredNVCage << "vkCompileDeferredNV"
  getRayTracingShaderGroupHandlesNVCage << "vkGetRayTracingShaderGroupHandlesNV"
  cmdBuildAccelerationStructureNVCage << "vkCmdBuildAccelerationStructureNV"
  destroyAccelerationStructureNVCage << "vkDestroyAccelerationStructureNV"
  cmdTraceRaysNVCage << "vkCmdTraceRaysNV"
  cmdCopyAccelerationStructureNVCage << "vkCmdCopyAccelerationStructureNV"
  createRayTracingPipelinesNVCage << "vkCreateRayTracingPipelinesNV"
  bindAccelerationStructureMemoryNVCage << "vkBindAccelerationStructureMemoryNV"
  cmdWriteAccelerationStructuresPropertiesNVCage << "vkCmdWriteAccelerationStructuresPropertiesNV"