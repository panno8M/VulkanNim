# Generated at 2021-08-27T06:01:03Z
# VK_INTEL_performance_query
# =================================

import ../platform
import ../features/vk10


const
  IntelPerformanceQuerySpecVersion* = 2
  IntelPerformanceQueryExtensionName* = "VK_INTEL_performance_query"

type
  PerformanceConfigurationTypeINTEL* {.size: sizeof(int32), pure.} = enum
    CommandQueueMetricsDiscoveryActivatedIntel = 0
  QueryPoolSamplingModeINTEL* {.size: sizeof(int32), pure.} = enum
    ManualIntel = 0
  PerformanceOverrideTypeINTEL* {.size: sizeof(int32), pure.} = enum
    NullHardwareIntel = 0
    FlushGpuCachesIntel = 1
  PerformanceParameterTypeINTEL* {.size: sizeof(int32), pure.} = enum
    HwCountersSupportedIntel = 0
    StreamMarkerValidBitsIntel = 1
  PerformanceValueTypeINTEL* {.size: sizeof(int32), pure.} = enum
    Uint32Intel = 0
    Uint64Intel = 1
    FloatIntel = 2
    BoolIntel = 3
    StringIntel = 4
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
    sType*: StructureType
    pNext*: pointer
    pUserData*: pointer
  QueryPoolCreateInfoINTEL* = object
  QueryPoolPerformanceQueryCreateInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    performanceCountersSampling*: QueryPoolSamplingModeINTEL
  PerformanceMarkerInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    marker*: uint64
  PerformanceStreamMarkerInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    marker*: uint32
  PerformanceOverrideInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    theType*: PerformanceOverrideTypeINTEL
    enable*: Bool32
    parameter*: uint64
  PerformanceConfigurationAcquireInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    theType*: PerformanceConfigurationTypeINTEL
  PerformanceConfigurationINTEL* = distinct NonDispatchableHandle

var # commands
  initializePerformanceApiINTELCage: proc(device: Device; pInitializeInfo: ptr InitializePerformanceApiInfoINTEL;): Result {.cdecl.}
  uninitializePerformanceApiINTELCage: proc(device: Device;): void {.cdecl.}
  cmdSetPerformanceMarkerINTELCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr PerformanceMarkerInfoINTEL;): Result {.cdecl.}
  cmdSetPerformanceStreamMarkerINTELCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr PerformanceStreamMarkerInfoINTEL;): Result {.cdecl.}
  cmdSetPerformanceOverrideINTELCage: proc(commandBuffer: CommandBuffer; pOverrideInfo: ptr PerformanceOverrideInfoINTEL;): Result {.cdecl.}
  acquirePerformanceConfigurationINTELCage: proc(device: Device; pAcquireInfo: ptr PerformanceConfigurationAcquireInfoINTEL; pConfiguration: ptr PerformanceConfigurationINTEL;): Result {.cdecl.}
  releasePerformanceConfigurationINTELCage: proc(device: Device; configuration: PerformanceConfigurationINTEL;): Result {.cdecl.}
  queueSetPerformanceConfigurationINTELCage: proc(queue: Queue; configuration: PerformanceConfigurationINTEL;): Result {.cdecl.}
  getPerformanceParameterINTELCage: proc(device: Device; parameter: PerformanceParameterTypeINTEL; pValue: ptr PerformanceValueINTEL;): Result {.cdecl.}
proc initializePerformanceApiINTEL*(
      device: Device;
      pInitializeInfo: ptr InitializePerformanceApiInfoINTEL;
    ): Result {.cdecl, discardable.} =
  initializePerformanceApiINTELCage(device,pInitializeInfo)
proc uninitializePerformanceApiINTEL*(
      device: Device;
    ): void {.cdecl.} =
  uninitializePerformanceApiINTELCage(device)
proc cmdSetPerformanceMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceMarkerInfoINTEL;
    ): Result {.cdecl, discardable.} =
  cmdSetPerformanceMarkerINTELCage(commandBuffer,pMarkerInfo)
proc cmdSetPerformanceStreamMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceStreamMarkerInfoINTEL;
    ): Result {.cdecl, discardable.} =
  cmdSetPerformanceStreamMarkerINTELCage(commandBuffer,pMarkerInfo)
proc cmdSetPerformanceOverrideINTEL*(
      commandBuffer: CommandBuffer;
      pOverrideInfo: ptr PerformanceOverrideInfoINTEL;
    ): Result {.cdecl, discardable.} =
  cmdSetPerformanceOverrideINTELCage(commandBuffer,pOverrideInfo)
proc acquirePerformanceConfigurationINTEL*(
      device: Device;
      pAcquireInfo: ptr PerformanceConfigurationAcquireInfoINTEL;
      pConfiguration: ptr PerformanceConfigurationINTEL;
    ): Result {.cdecl, discardable.} =
  acquirePerformanceConfigurationINTELCage(device,pAcquireInfo,pConfiguration)
proc releasePerformanceConfigurationINTEL*(
      device: Device;
      configuration: PerformanceConfigurationINTEL;
    ): Result {.cdecl, discardable.} =
  releasePerformanceConfigurationINTELCage(device,configuration)
proc queueSetPerformanceConfigurationINTEL*(
      queue: Queue;
      configuration: PerformanceConfigurationINTEL;
    ): Result {.cdecl, discardable.} =
  queueSetPerformanceConfigurationINTELCage(queue,configuration)
proc getPerformanceParameterINTEL*(
      device: Device;
      parameter: PerformanceParameterTypeINTEL;
      pValue: ptr PerformanceValueINTEL;
    ): Result {.cdecl, discardable.} =
  getPerformanceParameterINTELCage(device,parameter,pValue)
proc loadVK_INTEL_performance_query*(instance: Instance) =
  instance.defineLoader(`<<`)

  initializePerformanceApiINTELCage << "vkInitializePerformanceApiINTEL"
  uninitializePerformanceApiINTELCage << "vkUninitializePerformanceApiINTEL"
  cmdSetPerformanceMarkerINTELCage << "vkCmdSetPerformanceMarkerINTEL"
  cmdSetPerformanceStreamMarkerINTELCage << "vkCmdSetPerformanceStreamMarkerINTEL"
  cmdSetPerformanceOverrideINTELCage << "vkCmdSetPerformanceOverrideINTEL"
  acquirePerformanceConfigurationINTELCage << "vkAcquirePerformanceConfigurationINTEL"
  releasePerformanceConfigurationINTELCage << "vkReleasePerformanceConfigurationINTEL"
  queueSetPerformanceConfigurationINTELCage << "vkQueueSetPerformanceConfigurationINTEL"
  getPerformanceParameterINTELCage << "vkGetPerformanceParameterINTEL"