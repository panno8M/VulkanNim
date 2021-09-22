# Generated at 2021-09-22T15:05:57Z
# VK_INTEL_performance_query


import ../platform
import ../features/vk10

const
  IntelPerformanceQuerySpecVersion* = 2
  IntelPerformanceQueryExtensionName* = "VK_INTEL_performance_query"

type # enums and bitmasks
  PerformanceConfigurationTypeINTEL* {.size: sizeof(int32), pure.} = enum
    commandQueueMetricsDiscoveryActivatedIntel = 0
  QueryPoolSamplingModeINTEL* {.size: sizeof(int32), pure.} = enum
    manualIntel = 0
  PerformanceOverrideTypeINTEL* {.size: sizeof(int32), pure.} = enum
    nullHardwareIntel = 0
    flushGpuCachesIntel = 1
  PerformanceParameterTypeINTEL* {.size: sizeof(int32), pure.} = enum
    hwCountersSupportedIntel = 0
    streamMarkerValidsIntel = 1
  PerformanceValueTypeINTEL* {.size: sizeof(int32), pure.} = enum
    uint32Intel = 0
    uint64Intel = 1
    floatIntel = 2
    boolIntel = 3
    stringIntel = 4

type
  PerformanceValueDataINTEL* {.union.} = object
    value32*: uint32
    value64*: uint64
    valueFloat*: float32
    valueBool*: Bool32
    valueString*: cstring
  PerformanceValueINTEL* = object
    theType*: PerformanceValueTypeINTEL
    data*: PerformanceValueDataINTEL
  InitializePerformanceApiInfoINTEL* = object
    sType* {.constant: (StructureType.initializePerformanceApiInfoIntel).}: StructureType
    pNext* {.optional.}: pointer
    pUserData* {.optional.}: pointer
  QueryPoolCreateInfoINTEL* = object
  QueryPoolPerformanceQueryCreateInfoINTEL* = object
    sType* {.constant: (StructureType.queryPoolPerformanceQueryCreateInfoIntel).}: StructureType
    pNext* {.optional.}: pointer
    performanceCountersSampling*: QueryPoolSamplingModeINTEL
  PerformanceMarkerInfoINTEL* = object
    sType* {.constant: (StructureType.performanceMarkerInfoIntel).}: StructureType
    pNext* {.optional.}: pointer
    marker*: uint64
  PerformanceStreamMarkerInfoINTEL* = object
    sType* {.constant: (StructureType.performanceStreamMarkerInfoIntel).}: StructureType
    pNext* {.optional.}: pointer
    marker*: uint32
  PerformanceOverrideInfoINTEL* = object
    sType* {.constant: (StructureType.performanceOverrideInfoIntel).}: StructureType
    pNext* {.optional.}: pointer
    theType*: PerformanceOverrideTypeINTEL
    enable*: Bool32
    parameter*: uint64
  PerformanceConfigurationAcquireInfoINTEL* = object
    sType* {.constant: (StructureType.performanceConfigurationAcquireInfoIntel).}: StructureType
    pNext* {.optional.}: pointer
    theType*: PerformanceConfigurationTypeINTEL
  HtPerformanceConfigurationINTEL* = object of HandleType
  PerformanceConfigurationINTEL* = NonDispatchableHandle[HtPerformanceConfigurationINTEL]

proc initializePerformanceApiINTEL*(
      device: Device;
      pInitializeInfo: ptr InitializePerformanceApiInfoINTEL;
    ): Result {.cdecl, lazyload("vkInitializePerformanceApiINTEL", DeviceLevel).}
proc uninitializePerformanceApiINTEL*(
      device: Device;
    ): void {.cdecl, lazyload("vkUninitializePerformanceApiINTEL", DeviceLevel).}
proc cmdSetPerformanceMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceMarkerInfoINTEL;
    ): Result {.cdecl, lazyload("vkCmdSetPerformanceMarkerINTEL", DeviceLevel).}
proc cmdSetPerformanceStreamMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceStreamMarkerInfoINTEL;
    ): Result {.cdecl, lazyload("vkCmdSetPerformanceStreamMarkerINTEL", DeviceLevel).}
proc cmdSetPerformanceOverrideINTEL*(
      commandBuffer: CommandBuffer;
      pOverrideInfo: ptr PerformanceOverrideInfoINTEL;
    ): Result {.cdecl, lazyload("vkCmdSetPerformanceOverrideINTEL", DeviceLevel).}
proc acquirePerformanceConfigurationINTEL*(
      device: Device;
      pAcquireInfo: ptr PerformanceConfigurationAcquireInfoINTEL;
      pConfiguration: ptr PerformanceConfigurationINTEL;
    ): Result {.cdecl, lazyload("vkAcquirePerformanceConfigurationINTEL", DeviceLevel).}
proc releasePerformanceConfigurationINTEL*(
      device: Device;
      configuration = default(PerformanceConfigurationINTEL);
    ): Result {.cdecl, lazyload("vkReleasePerformanceConfigurationINTEL", DeviceLevel).}
proc queueSetPerformanceConfigurationINTEL*(
      queue: Queue;
      configuration: PerformanceConfigurationINTEL;
    ): Result {.cdecl, lazyload("vkQueueSetPerformanceConfigurationINTEL", DeviceLevel).}
proc getPerformanceParameterINTEL*(
      device: Device;
      parameter: PerformanceParameterTypeINTEL;
      pValue: ptr PerformanceValueINTEL;
    ): Result {.cdecl, lazyload("vkGetPerformanceParameterINTEL", DeviceLevel).}
StructureType.defineAliases:
  queryPoolPerformanceQueryCreateInfoIntel as queryPoolCreateInfoIntel


proc loadAllVK_INTEL_performance_query*(instance: Instance) =
  initializePerformanceApiINTEL.load(instance)
  uninitializePerformanceApiINTEL.load(instance)
  cmdSetPerformanceMarkerINTEL.load(instance)
  cmdSetPerformanceStreamMarkerINTEL.load(instance)
  cmdSetPerformanceOverrideINTEL.load(instance)
  acquirePerformanceConfigurationINTEL.load(instance)
  releasePerformanceConfigurationINTEL.load(instance)
  queueSetPerformanceConfigurationINTEL.load(instance)
  getPerformanceParameterINTEL.load(instance)

proc loadVK_INTEL_performance_query*(device: Device) =
  initializePerformanceApiINTEL.load(device)
  uninitializePerformanceApiINTEL.load(device)
  cmdSetPerformanceMarkerINTEL.load(device)
  cmdSetPerformanceStreamMarkerINTEL.load(device)
  cmdSetPerformanceOverrideINTEL.load(device)
  acquirePerformanceConfigurationINTEL.load(device)
  releasePerformanceConfigurationINTEL.load(device)
  queueSetPerformanceConfigurationINTEL.load(device)
  getPerformanceParameterINTEL.load(device)

