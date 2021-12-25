# Generated at 2021-12-25T07:50:19Z
# VK_KHR_performance_query

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrPerformanceQuerySpecVersion* = 1
  KhrPerformanceQueryExtensionName* = "VK_KHR_performance_query"
  UuidSize* = 16
  MaxDescriptionSize* = 256

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
  instance.loadCommand enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR
  instance.loadCommand getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR
  instance.loadCommand acquireProfilingLockKHR
  instance.loadCommand releaseProfilingLockKHR

proc loadVK_KHR_performance_query*(instance: Instance) =
  instance.loadCommand enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR
  instance.loadCommand getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR

proc loadVK_KHR_performance_query*(device: Device) =
  device.loadCommand acquireProfilingLockKHR
  device.loadCommand releaseProfilingLockKHR

