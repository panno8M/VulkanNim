
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PerformanceCounterDescriptionFlagBitsKHR* = UnusedEnum
  PerformanceCounterStorageKHR* {.size: sizeof(int32), pure.} = enum
    Int32 = 0
    Int64 = 1
    Uint32 = 2
    Uint64 = 3
    Float32 = 4
    Float64 = 5
  AcquireProfilingLockInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: AcquireProfilingLockFlagsKHR
    timeout*: uint64
  PerformanceCounterDescriptionFlagsKHR* = distinct Flags
  AcquireProfilingLockFlagBitsKHR* = UnusedEnum
  PerformanceCounterDescriptionKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PerformanceCounterDescriptionFlagsKHR
    name*: char
    category*: char
    description*: char
  PerformanceQuerySubmitInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    counterPassIndex*: uint32
  # Union of all the possible return types a counter result could return
  PerformanceCounterResultKHR* {.union.} = object
    int32*: int32
    int64*: int64
    uint32*: uint32
    uint64*: uint64
    float32*: float32
    float64*: float64
  PhysicalDevicePerformanceQueryFeaturesKHR* = object
    sType*: StructureType
    pNext*: pointer
    performanceCounterQueryPools*: Bool32
    performanceCounterMultipleQueryPools*: Bool32
  PerformanceCounterScopeKHR* = UnusedEnum
  PerformanceCounterKHR* = object
    sType*: StructureType
    pNext*: pointer
    unit*: PerformanceCounterUnitKHR
    scope*: PerformanceCounterScopeKHR
    storage*: PerformanceCounterStorageKHR
    uuid*: uint8
  QueryPoolPerformanceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    queueFamilyIndex*: uint32
    counterIndexCount*: uint32
    pCounterIndices*: ptr uint32
  PhysicalDevicePerformanceQueryPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    allowCommandBufferQueryCopies*: Bool32
  PerformanceCounterUnitKHR* {.size: sizeof(int32), pure.} = enum
    Generic = 0
    Percentage = 1
    Nanoseconds = 2
    Bytes = 3
    BytesPerSecond = 4
    Kelvin = 5
    Watts = 6
    Volts = 7
    Amps = 8
    Hertz = 9
    Cycles = 10
  AcquireProfilingLockFlagsKHR* = distinct Flags

const KhrPerformanceQuerySpecVersion* = 1
const KhrPerformanceQueryExtensionName* = "VK_KHR_performance_query"
var # commands
  releaseProfilingLockKHRCage: proc(device: Device;): void {.cdecl.}
  acquireProfilingLockKHRCage: proc(device: Device; pInfo: ptr AcquireProfilingLockInfoKHR;): Result {.cdecl.}
  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; pCounterCount: ptr uint32; pCounters: ptr PerformanceCounterKHR; pCounterDescriptions: ptr PerformanceCounterDescriptionKHR;): Result {.cdecl.}
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRCage: proc(physicalDevice: PhysicalDevice; pPerformanceQueryCreateInfo: ptr QueryPoolPerformanceCreateInfoKHR; pNumPasses: ptr uint32;): void {.cdecl.}

proc releaseProfilingLockKHR*(
      device: Device;
    ): void {.cdecl.} =
  releaseProfilingLockKHRCage(device)

proc acquireProfilingLockKHR*(
      device: Device;
      pInfo: ptr AcquireProfilingLockInfoKHR;
    ): Result {.cdecl.} =
  acquireProfilingLockKHRCage(device,pInfo)

proc enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      pCounterCount: ptr uint32;
      pCounters: ptr PerformanceCounterKHR;
      pCounterDescriptions: ptr PerformanceCounterDescriptionKHR;
    ): Result {.cdecl.} =
  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRCage(physicalDevice,queueFamilyIndex,pCounterCount,pCounters,pCounterDescriptions)

proc getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR*(
      physicalDevice: PhysicalDevice;
      pPerformanceQueryCreateInfo: ptr QueryPoolPerformanceCreateInfoKHR;
      pNumPasses: ptr uint32;
    ): void {.cdecl.} =
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRCage(physicalDevice,pPerformanceQueryCreateInfo,pNumPasses)


proc loadVK_KHR_performance_query*(instance: Instance) =
  instance.defineLoader(`<<`)

  releaseProfilingLockKHRCage << "vkReleaseProfilingLockKHR"
  acquireProfilingLockKHRCage << "vkAcquireProfilingLockKHR"
  enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHRCage << "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"
  getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHRCage << "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"