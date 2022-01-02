# VK_KHR_acceleration_structure

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrAccelerationStructureSpecVersion* = 13
  KhrAccelerationStructureExtensionName* = "VK_KHR_acceleration_structure"

type
  DeviceOrHostAddressKHR* {.union.} = object
    deviceAddress*: DeviceAddress
    hostAddress*: pointer
  DeviceOrHostAddressConstKHR* {.union.} = object
    deviceAddress*: DeviceAddress
    hostAddress*: pointer
  AccelerationStructureBuildRangeInfoKHR* = object
    primitiveCount*: uint32
    primitiveOffset*: uint32
    firstVertex*: uint32
    transformOffset*: uint32
  AabbPositionsKHR* = object
    minX*: float32
    minY*: float32
    minZ*: float32
    maxX*: float32
    maxY*: float32
    maxZ*: float32
  AccelerationStructureGeometryTrianglesDataKHR* = object
    sType* {.constant: (StructureType.accelerationStructureGeometryTrianglesDataKhr).}: StructureType
    pNext* {.optional.}: pointer
    vertexFormat*: Format
    vertexData*: DeviceOrHostAddressConstKHR
    vertexStride*: DeviceSize
    maxVertex*: uint32
    indexType*: IndexType
    indexData*: DeviceOrHostAddressConstKHR
    transformData*: DeviceOrHostAddressConstKHR
  TransformMatrixKHR* = object
    matrix*: array[3, array[4, float32]]
  AccelerationStructureBuildGeometryInfoKHR* = object
    sType* {.constant: (StructureType.accelerationStructureBuildGeometryInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    theType*: AccelerationStructureTypeKHR
    flags* {.optional.}: BuildAccelerationStructureFlagsKHR
    mode*: BuildAccelerationStructureModeKHR
    srcAccelerationStructure* {.optional.}: AccelerationStructureKHR
    dstAccelerationStructure* {.optional.}: AccelerationStructureKHR
    geometryCount* {.optional.}: uint32
    pGeometries* {.optional, length: geometryCount.}: arrPtr[AccelerationStructureGeometryKHR]
    ppGeometries* {.length: geometryCount, 1.}: arrPtr[arrPtr[AccelerationStructureGeometryKHR]]
    scratchData*: DeviceOrHostAddressKHR
  AccelerationStructureGeometryAabbsDataKHR* = object
    sType* {.constant: (StructureType.accelerationStructureGeometryAabbsDataKhr).}: StructureType
    pNext* {.optional.}: pointer
    data*: DeviceOrHostAddressConstKHR
    stride*: DeviceSize
  AccelerationStructureInstanceKHR* = object
    transform*: TransformMatrixKHR
    instanceCustomIndex*: uint32
    mask*: uint32
    instanceShaderBindingTableRecordOffset*: uint32
    flags* {.optional.}: GeometryInstanceFlagsKHR
    accelerationStructureReference*: uint64
  AccelerationStructureGeometryInstancesDataKHR* = object
    sType* {.constant: (StructureType.accelerationStructureGeometryInstancesDataKhr).}: StructureType
    pNext* {.optional.}: pointer
    arrayOfPointers*: Bool32
    data*: DeviceOrHostAddressConstKHR
  AccelerationStructureGeometryDataKHR* {.union.} = object
    triangles*: AccelerationStructureGeometryTrianglesDataKHR
    aabbs*: AccelerationStructureGeometryAabbsDataKHR
    instances*: AccelerationStructureGeometryInstancesDataKHR
  AccelerationStructureGeometryKHR* = object
    sType* {.constant: (StructureType.accelerationStructureGeometryKhr).}: StructureType
    pNext* {.optional.}: pointer
    geometryType*: GeometryTypeKHR
    geometry*: AccelerationStructureGeometryDataKHR
    flags* {.optional.}: GeometryFlagsKHR
  AccelerationStructureCreateInfoKHR* = object
    sType* {.constant: (StructureType.accelerationStructureCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    createFlags* {.optional.}: AccelerationStructureCreateFlagsKHR
    buffer*: Buffer
    offset*: DeviceSize
    size*: DeviceSize
    theType*: AccelerationStructureTypeKHR
    deviceAddress* {.optional.}: DeviceAddress
  WriteDescriptorSetAccelerationStructureKHR* = object
    sType* {.constant: (StructureType.writeDescriptorSetAccelerationStructureKhr).}: StructureType
    pNext* {.optional.}: pointer
    accelerationStructureCount*: uint32
    pAccelerationStructures* {.length: accelerationStructureCount.}: arrPtr[AccelerationStructureKHR]
  PhysicalDeviceAccelerationStructureFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceAccelerationStructureFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    accelerationStructure*: Bool32
    accelerationStructureCaptureReplay*: Bool32
    accelerationStructureIndirectBuild*: Bool32
    accelerationStructureHostCommands*: Bool32
    descriptorBindingAccelerationStructureUpdateAfterBind*: Bool32
  PhysicalDeviceAccelerationStructurePropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceAccelerationStructurePropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    maxGeometryCount*: uint64
    maxInstanceCount*: uint64
    maxPrimitiveCount*: uint64
    maxPerStageDescriptorAccelerationStructures*: uint32
    maxPerStageDescriptorUpdateAfterBindAccelerationStructures*: uint32
    maxDescriptorSetAccelerationStructures*: uint32
    maxDescriptorSetUpdateAfterBindAccelerationStructures*: uint32
    minAccelerationStructureScratchOffsetAlignment*: uint32
  AccelerationStructureDeviceAddressInfoKHR* = object
    sType* {.constant: (StructureType.accelerationStructureDeviceAddressInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    accelerationStructure*: AccelerationStructureKHR
  AccelerationStructureVersionInfoKHR* = object
    sType* {.constant: (StructureType.accelerationStructureVersionInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pVersionData* {.length: 2*VK_UUID_SIZE.}: arrPtr[arrPtr[uint8]]
  CopyAccelerationStructureToMemoryInfoKHR* = object
    sType* {.constant: (StructureType.copyAccelerationStructureToMemoryInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    src*: AccelerationStructureKHR
    dst*: DeviceOrHostAddressKHR
    mode*: CopyAccelerationStructureModeKHR
  CopyMemoryToAccelerationStructureInfoKHR* = object
    sType* {.constant: (StructureType.copyMemoryToAccelerationStructureInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    src*: DeviceOrHostAddressConstKHR
    dst*: AccelerationStructureKHR
    mode*: CopyAccelerationStructureModeKHR
  CopyAccelerationStructureInfoKHR* = object
    sType* {.constant: (StructureType.copyAccelerationStructureInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    src*: AccelerationStructureKHR
    dst*: AccelerationStructureKHR
    mode*: CopyAccelerationStructureModeKHR
  AccelerationStructureBuildSizesInfoKHR* = object
    sType* {.constant: (StructureType.accelerationStructureBuildSizesInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    accelerationStructureSize*: DeviceSize
    updateScratchSize*: DeviceSize
    buildScratchSize*: DeviceSize

proc createAccelerationStructureKHR*(
      device: Device;
      pCreateInfo: ptr AccelerationStructureCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pAccelerationStructure: ptr AccelerationStructureKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidOpaqueCaptureAddressKhr],
      lazyload("vkCreateAccelerationStructureKHR", DeviceLevel).}
proc destroyAccelerationStructureKHR*(
      device: Device;
      accelerationStructure = default(AccelerationStructureKHR);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyAccelerationStructureKHR", DeviceLevel).}
proc cmdBuildAccelerationStructuresKHR*(
      commandBuffer: CommandBuffer;
      infoCount: uint32;
      pInfos {.length: infoCount.}: arrPtr[AccelerationStructureBuildGeometryInfoKHR];
      ppBuildRangeInfos {.length: infoCount.}: arrPtr[arrPtr[AccelerationStructureBuildRangeInfoKHR]];
    ): void {.cdecl, lazyload("vkCmdBuildAccelerationStructuresKHR", DeviceLevel).}
proc cmdBuildAccelerationStructuresIndirectKHR*(
      commandBuffer: CommandBuffer;
      infoCount: uint32;
      pInfos {.length: infoCount.}: arrPtr[AccelerationStructureBuildGeometryInfoKHR];
      pIndirectDeviceAddresses {.length: infoCount.}: arrPtr[DeviceAddress];
      pIndirectStrides {.length: infoCount.}: arrPtr[uint32];
      ppMaxPrimitiveCounts {.length: infoCount.}: arrPtr[arrPtr[uint32]];
    ): void {.cdecl, lazyload("vkCmdBuildAccelerationStructuresIndirectKHR", DeviceLevel).}
proc buildAccelerationStructuresKHR*(
      device: Device;
      deferredOperation = default(DeferredOperationKHR);
      infoCount: uint32;
      pInfos {.length: infoCount.}: arrPtr[AccelerationStructureBuildGeometryInfoKHR];
      ppBuildRangeInfos {.length: infoCount.}: arrPtr[arrPtr[AccelerationStructureBuildRangeInfoKHR]];
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.operationDeferredKhr, Result.operationNotDeferredKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkBuildAccelerationStructuresKHR", DeviceLevel).}
proc copyAccelerationStructureKHR*(
      device: Device;
      deferredOperation = default(DeferredOperationKHR);
      pInfo: ptr CopyAccelerationStructureInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.operationDeferredKhr, Result.operationNotDeferredKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCopyAccelerationStructureKHR", DeviceLevel).}
proc copyAccelerationStructureToMemoryKHR*(
      device: Device;
      deferredOperation = default(DeferredOperationKHR);
      pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.operationDeferredKhr, Result.operationNotDeferredKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCopyAccelerationStructureToMemoryKHR", DeviceLevel).}
proc copyMemoryToAccelerationStructureKHR*(
      device: Device;
      deferredOperation = default(DeferredOperationKHR);
      pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.operationDeferredKhr, Result.operationNotDeferredKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCopyMemoryToAccelerationStructureKHR", DeviceLevel).}
proc writeAccelerationStructuresPropertiesKHR*(
      device: Device;
      accelerationStructureCount: uint32;
      pAccelerationStructures {.length: accelerationStructureCount.}: arrPtr[AccelerationStructureKHR];
      queryType: QueryType;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
      stride: uint;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkWriteAccelerationStructuresPropertiesKHR", DeviceLevel).}
proc cmdCopyAccelerationStructureKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr CopyAccelerationStructureInfoKHR;
    ): void {.cdecl, lazyload("vkCmdCopyAccelerationStructureKHR", DeviceLevel).}
proc cmdCopyAccelerationStructureToMemoryKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr CopyAccelerationStructureToMemoryInfoKHR;
    ): void {.cdecl, lazyload("vkCmdCopyAccelerationStructureToMemoryKHR", DeviceLevel).}
proc cmdCopyMemoryToAccelerationStructureKHR*(
      commandBuffer: CommandBuffer;
      pInfo: ptr CopyMemoryToAccelerationStructureInfoKHR;
    ): void {.cdecl, lazyload("vkCmdCopyMemoryToAccelerationStructureKHR", DeviceLevel).}
proc getAccelerationStructureDeviceAddressKHR*(
      device: Device;
      pInfo: ptr AccelerationStructureDeviceAddressInfoKHR;
    ): DeviceAddress {.cdecl, lazyload("vkGetAccelerationStructureDeviceAddressKHR", DeviceLevel).}
proc cmdWriteAccelerationStructuresPropertiesKHR*(
      commandBuffer: CommandBuffer;
      accelerationStructureCount: uint32;
      pAccelerationStructures {.length: accelerationStructureCount.}: arrPtr[AccelerationStructureKHR];
      queryType: QueryType;
      queryPool: QueryPool;
      firstQuery: uint32;
    ): void {.cdecl, lazyload("vkCmdWriteAccelerationStructuresPropertiesKHR", DeviceLevel).}
proc getDeviceAccelerationStructureCompatibilityKHR*(
      device: Device;
      pVersionInfo: ptr AccelerationStructureVersionInfoKHR;
      pCompatibility: ptr AccelerationStructureCompatibilityKHR;
    ): void {.cdecl, lazyload("vkGetDeviceAccelerationStructureCompatibilityKHR", DeviceLevel).}
proc getAccelerationStructureBuildSizesKHR*(
      device: Device;
      buildType: AccelerationStructureBuildTypeKHR;
      pBuildInfo: ptr AccelerationStructureBuildGeometryInfoKHR;
      pMaxPrimitiveCounts {.length: pBuildInfo.geometryCount.} = default(arrPtr[uint32]);
      pSizeInfo: ptr AccelerationStructureBuildSizesInfoKHR;
    ): void {.cdecl, lazyload("vkGetAccelerationStructureBuildSizesKHR", DeviceLevel).}

proc loadAllVK_KHR_acceleration_structure*(instance: Instance) = instance.loadCommands:
  createAccelerationStructureKHR
  destroyAccelerationStructureKHR
  cmdBuildAccelerationStructuresKHR
  cmdBuildAccelerationStructuresIndirectKHR
  buildAccelerationStructuresKHR
  copyAccelerationStructureKHR
  copyAccelerationStructureToMemoryKHR
  copyMemoryToAccelerationStructureKHR
  writeAccelerationStructuresPropertiesKHR
  cmdCopyAccelerationStructureKHR
  cmdCopyAccelerationStructureToMemoryKHR
  cmdCopyMemoryToAccelerationStructureKHR
  getAccelerationStructureDeviceAddressKHR
  cmdWriteAccelerationStructuresPropertiesKHR
  getDeviceAccelerationStructureCompatibilityKHR
  getAccelerationStructureBuildSizesKHR
proc loadVK_KHR_acceleration_structure*(device: Device) = device.loadCommands:
  createAccelerationStructureKHR
  destroyAccelerationStructureKHR
  cmdBuildAccelerationStructuresKHR
  cmdBuildAccelerationStructuresIndirectKHR
  buildAccelerationStructuresKHR
  copyAccelerationStructureKHR
  copyAccelerationStructureToMemoryKHR
  copyMemoryToAccelerationStructureKHR
  writeAccelerationStructuresPropertiesKHR
  cmdCopyAccelerationStructureKHR
  cmdCopyAccelerationStructureToMemoryKHR
  cmdCopyMemoryToAccelerationStructureKHR
  getAccelerationStructureDeviceAddressKHR
  cmdWriteAccelerationStructuresPropertiesKHR
  getDeviceAccelerationStructureCompatibilityKHR
  getAccelerationStructureBuildSizesKHR
