# Generated at 2021-10-02T09:29:45Z
# VK_KHR_performance_query


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  KhrPerformanceQuerySpecVersion* = 1
  KhrPerformanceQueryExtensionName* = "VK_KHR_performance_query"
  UuidSize* = 16
  MaxDescriptionSize* = 256

type # enums and bitmasks
  PerformanceCounterDescriptionFlagsKHR* = Flags[PerformanceCounterDescriptionFlagBitsKHR]
  PerformanceCounterDescriptionFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    performanceImpactingKhr = 0x00000001
    concurrentlyImpactedKhr = 0x00000002
  PerformanceCounterScopeKHR* {.size: sizeof(int32), pure.} = enum
    commandBufferKhr = 0
    renderPassKhr = 1
    commandKhr = 2
  PerformanceCounterStorageKHR* {.size: sizeof(int32), pure.} = enum
    int32Khr = 0
    int64Khr = 1
    uint32Khr = 2
    uint64Khr = 3
    float32Khr = 4
    float64Khr = 5
  PerformanceCounterUnitKHR* {.size: sizeof(int32), pure.} = enum
    genericKhr = 0
    percentageKhr = 1
    nanosecondsKhr = 2
    bytesKhr = 3
    bytesPerSecondKhr = 4
    kelvinKhr = 5
    wattsKhr = 6
    voltsKhr = 7
    ampsKhr = 8
    hertzKhr = 9
    cyclesKhr = 10
  AcquireProfilingLockFlagsKHR* = Flags[AcquireProfilingLockFlagBitsKHR]
  AcquireProfilingLockFlagBitsKHR* = distinct UnusedEnum

type
  PhysicalDevicePerformanceQueryFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDevicePerformanceQueryFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    performanceCounterQueryPools*: Bool32
    performanceCounterMultipleQueryPools*: Bool32
  PhysicalDevicePerformanceQueryPropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDevicePerformanceQueryPropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    allowCommandBufferQueryCopies*: Bool32
  PerformanceCounterKHR* = object
    sType* {.constant: (StructureType.performanceCounterKhr).}: StructureType
    pNext* {.optional.}: pointer
    unit*: PerformanceCounterUnitKHR
    scope*: PerformanceCounterScopeKHR
    storage*: PerformanceCounterStorageKHR
    uuid*: array[UuidSize, uint8]
  PerformanceCounterDescriptionKHR* = object
    sType* {.constant: (StructureType.performanceCounterDescriptionKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PerformanceCounterDescriptionFlagsKHR
    name*: array[MaxDescriptionSize, char]
    category*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
  QueryPoolPerformanceCreateInfoKHR* = object
    sType* {.constant: (StructureType.queryPoolPerformanceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    queueFamilyIndex*: uint32
    counterIndexCount*: uint32
    pCounterIndices* {.length: counterIndexCount.}: arrPtr[uint32]
  # Union of all the possible return types a counter result could return
  PerformanceCounterResultKHR* {.union.} = object
    int32*: int32
    int64*: int64
    uint32*: uint32
    uint64*: uint64
    float32*: float32
    float64*: float64
  AcquireProfilingLockInfoKHR* = object
    sType* {.constant: (StructureType.acquireProfilingLockInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: AcquireProfilingLockFlagsKHR
    timeout*: uint64
  PerformanceQuerySubmitInfoKHR* = object
    sType* {.constant: (StructureType.performanceQuerySubmitInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    counterPassIndex*: uint32

PerformanceCounterScopeKHR.defineAliases:
  commandBufferKhr as queryScopeCommandBufferKhr
  renderPassKhr as queryScopeRenderPassKhr
  commandKhr as queryScopeCommandKhr

proc enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      pCounterCount: ptr uint32;
      pCounters {.length: pCounterCount.} = default(arrPtr[PerformanceCounterKHR]);
      pCounterDescriptions {.length: pCounterCount.} = default(arrPtr[PerformanceCounterDescriptionKHR]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed),
      lazyload("vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR", InstanceLevel).}
proc getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR*(
      physicalDevice: PhysicalDevice;
      pPerformanceQueryCreateInfo: ptr QueryPoolPerformanceCreateInfoKHR;
      pNumPasses: ptr uint32;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR", InstanceLevel).}
proc acquireProfilingLockKHR*(
      device: Device;
      pInfo: ptr AcquireProfilingLockInfoKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, timeout),
      lazyload("vkAcquireProfilingLockKHR", DeviceLevel).}
proc releaseProfilingLockKHR*(
      device: Device;
    ): void {.cdecl, lazyload("vkReleaseProfilingLockKHR", DeviceLevel).}

proc loadAllVK_KHR_performance_query*(instance: Instance) =
  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR.load(instance)
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR.load(instance)
  acquireProfilingLockKHR.load(instance)
  releaseProfilingLockKHR.load(instance)

proc loadVK_KHR_performance_query*(instance: Instance) =
  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR.load(instance)
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR.load(instance)

proc loadVK_KHR_performance_query*(device: Device) =
  acquireProfilingLockKHR.load(device)
  releaseProfilingLockKHR.load(device)

