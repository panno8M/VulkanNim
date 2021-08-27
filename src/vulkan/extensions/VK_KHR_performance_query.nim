# Generated at 2021-08-27T06:01:02Z
# VK_KHR_performance_query
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


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
  PerformanceCounterDescriptionFlagsKHR* = distinct Flags
  PerformanceCounterDescriptionFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    PerformanceImpactingKhr = 0x00000001
    ConcurrentlyImpactedKhr = 0x00000002
  QueryPoolPerformanceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    queueFamilyIndex*: uint32
    counterIndexCount*: uint32
    pCounterIndices*: ptr uint32
  PerformanceCounterScopeKHR* {.size: sizeof(int32), pure.} = enum
    CommandBufferKhr = 0
    RenderPassKhr = 1
    CommandKhr = 2
  PerformanceCounterStorageKHR* {.size: sizeof(int32), pure.} = enum
    Int32Khr = 0
    Int64Khr = 1
    Uint32Khr = 2
    Uint64Khr = 3
    Float32Khr = 4
    Float64Khr = 5
  PerformanceCounterUnitKHR* {.size: sizeof(int32), pure.} = enum
    GenericKhr = 0
    PercentageKhr = 1
    NanosecondsKhr = 2
    BytesKhr = 3
    BytesPerSecondKhr = 4
    KelvinKhr = 5
    WattsKhr = 6
    VoltsKhr = 7
    AmpsKhr = 8
    HertzKhr = 9
    CyclesKhr = 10
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
  AcquireProfilingLockFlagsKHR* = distinct Flags
  AcquireProfilingLockFlagBitsKHR* = UnusedEnum
  PerformanceQuerySubmitInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    counterPassIndex*: uint32

PerformanceCounterScopeKHR.defineAliases:
  CommandBufferKhr as QueryScopeCommandBufferKhr
  RenderPassKhr as QueryScopeRenderPassKhr
  CommandKhr as QueryScopeCommandKhr

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