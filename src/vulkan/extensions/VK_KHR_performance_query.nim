# Generated at 2021-08-30T14:31:10Z
# VK_KHR_performance_query


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2

const
  KhrPerformanceQuerySpecVersion* = 1
  KhrPerformanceQueryExtensionName* = "VK_KHR_performance_query"
  UuidSize* = 16
  MaxDescriptionSize* = 256

type
  PhysicalDevicePerformanceQueryFeaturesKHR* = object
    sType*: StructureType
    pNext*: pointer
    performanceCounterQueryPools*: Bool32
    performanceCounterMultipleQueryPools*: Bool32
  PhysicalDevicePerformanceQueryPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    allowCommandBufferQueryCopies*: Bool32
  PerformanceCounterKHR* = object
    sType*: StructureType
    pNext*: pointer
    unit*: PerformanceCounterUnitKHR
    scope*: PerformanceCounterScopeKHR
    storage*: PerformanceCounterStorageKHR
    uuid*: array[UuidSize, uint8]
  PerformanceCounterDescriptionKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PerformanceCounterDescriptionFlagsKHR
    name*: array[MaxDescriptionSize, char]
    category*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
  PerformanceCounterDescriptionFlagsKHR* = Flags[PerformanceCounterDescriptionFlagBitsKHR]
  PerformanceCounterDescriptionFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    performanceImpactingKhr = 0x00000001
    concurrentlyImpactedKhr = 0x00000002
  QueryPoolPerformanceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    queueFamilyIndex*: uint32
    counterIndexCount*: uint32
    pCounterIndices*: ptr uint32
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
  # Union of all the possible return types a counter result could return
  PerformanceCounterResultKHR* {.union.} = object
    int32*: int32
    int64*: int64
    uint32*: uint32
    uint64*: uint64
    float32*: float32
    float64*: float64
  AcquireProfilingLockInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: AcquireProfilingLockFlagsKHR
    timeout*: uint64
  AcquireProfilingLockFlagsKHR* = Flags[AcquireProfilingLockFlagBitsKHR]
  AcquireProfilingLockFlagBitsKHR* = distinct UnusedEnum
  PerformanceQuerySubmitInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    counterPassIndex*: uint32

PerformanceCounterScopeKHR.defineAliases:
  commandBufferKhr as queryScopeCommandBufferKhr
  renderPassKhr as queryScopeRenderPassKhr
  commandKhr as queryScopeCommandKhr

var # commands
  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; pCounterCount: ptr uint32; pCounters: ptr PerformanceCounterKHR; pCounterDescriptions: ptr PerformanceCounterDescriptionKHR;): Result {.cdecl.}
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRCage: proc(physicalDevice: PhysicalDevice; pPerformanceQueryCreateInfo: ptr QueryPoolPerformanceCreateInfoKHR; pNumPasses: ptr uint32;): void {.cdecl.}
  acquireProfilingLockKHRCage: proc(device: Device; pInfo: ptr AcquireProfilingLockInfoKHR;): Result {.cdecl.}
  releaseProfilingLockKHRCage: proc(device: Device;): void {.cdecl.}
proc enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      pCounterCount: ptr uint32;
      pCounters: ptr PerformanceCounterKHR;
      pCounterDescriptions: ptr PerformanceCounterDescriptionKHR;
    ): Result {.cdecl, discardable.} =
  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRCage(physicalDevice,queueFamilyIndex,pCounterCount,pCounters,pCounterDescriptions)
proc getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR*(
      physicalDevice: PhysicalDevice;
      pPerformanceQueryCreateInfo: ptr QueryPoolPerformanceCreateInfoKHR;
      pNumPasses: ptr uint32;
    ): void {.cdecl.} =
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRCage(physicalDevice,pPerformanceQueryCreateInfo,pNumPasses)
proc acquireProfilingLockKHR*(
      device: Device;
      pInfo: ptr AcquireProfilingLockInfoKHR;
    ): Result {.cdecl, discardable.} =
  acquireProfilingLockKHRCage(device,pInfo)
proc releaseProfilingLockKHR*(
      device: Device;
    ): void {.cdecl.} =
  releaseProfilingLockKHRCage(device)
proc loadVK_KHR_performance_query*(instance: Instance) =
  instance.defineLoader(`<<`)

  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRCage << "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRCage << "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"
  acquireProfilingLockKHRCage << "vkAcquireProfilingLockKHR"
  releaseProfilingLockKHRCage << "vkReleaseProfilingLockKHR"