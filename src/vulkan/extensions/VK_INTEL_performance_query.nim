
import ../platform
import ../features/vk10


type
  PerformanceConfigurationTypeINTEL* {.size: sizeof(int32), pure.} = enum
    CommandQueueMetricsDiscoveryActivated = 0
  QueryPoolPerformanceQueryCreateInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    performanceCountersSampling*: QueryPoolSamplingModeINTEL
  PerformanceParameterTypeINTEL* {.size: sizeof(int32), pure.} = enum
    HwCountersSupported = 0
    StreamMarkerValidBits = 1
  PerformanceConfigurationINTEL* = distinct NonDispatchableHandle
  QueryPoolSamplingModeINTEL* {.size: sizeof(int32), pure.} = enum
    Manual = 0
  PerformanceValueDataINTEL* {.union.} = object
    value32*: uint32
    value64*: uint64
    valueFloat*: float32
    valueBool*: Bool32
    valueString*: cstring
  PerformanceConfigurationAcquireInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    theType*: PerformanceConfigurationTypeINTEL
  InitializePerformanceApiInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    pUserData*: pointer
  QueryPoolCreateInfoINTEL* = object
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
  PerformanceOverrideTypeINTEL* {.size: sizeof(int32), pure.} = enum
    NullHardware = 0
    FlushGpuCaches = 1
  PerformanceValueTypeINTEL* {.size: sizeof(int32), pure.} = enum
    Uint32 = 0
    Uint64 = 1
    Float = 2
    Bool = 3
    String = 4
  PerformanceValueINTEL* = object
    theType*: PerformanceValueTypeINTEL
    data*: PerformanceValueDataINTEL
  PerformanceMarkerInfoINTEL* = object
    sType*: StructureType
    pNext*: pointer
    marker*: uint64

const IntelPerformanceQueryExtensionName* = "VK_INTEL_performance_query"
const IntelPerformanceQuerySpecVersion* = 2
var # commands
  cmdSetPerformanceOverrideINTELCage: proc(commandBuffer: CommandBuffer; pOverrideInfo: ptr PerformanceOverrideInfoINTEL;): Result {.cdecl.}
  acquirePerformanceConfigurationINTELCage: proc(device: Device; pAcquireInfo: ptr PerformanceConfigurationAcquireInfoINTEL; pConfiguration: ptr PerformanceConfigurationINTEL;): Result {.cdecl.}
  getPerformanceParameterINTELCage: proc(device: Device; parameter: PerformanceParameterTypeINTEL; pValue: ptr PerformanceValueINTEL;): Result {.cdecl.}
  releasePerformanceConfigurationINTELCage: proc(device: Device; configuration: PerformanceConfigurationINTEL;): Result {.cdecl.}
  uninitializePerformanceApiINTELCage: proc(device: Device;): void {.cdecl.}
  queueSetPerformanceConfigurationINTELCage: proc(queue: Queue; configuration: PerformanceConfigurationINTEL;): Result {.cdecl.}
  cmdSetPerformanceMarkerINTELCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr PerformanceMarkerInfoINTEL;): Result {.cdecl.}
  cmdSetPerformanceStreamMarkerINTELCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr PerformanceStreamMarkerInfoINTEL;): Result {.cdecl.}
  initializePerformanceApiINTELCage: proc(device: Device; pInitializeInfo: ptr InitializePerformanceApiInfoINTEL;): Result {.cdecl.}

proc cmdSetPerformanceOverrideINTEL*(
      commandBuffer: CommandBuffer;
      pOverrideInfo: ptr PerformanceOverrideInfoINTEL;
    ): Result {.cdecl.} =
  cmdSetPerformanceOverrideINTELCage(commandBuffer,pOverrideInfo)

proc acquirePerformanceConfigurationINTEL*(
      device: Device;
      pAcquireInfo: ptr PerformanceConfigurationAcquireInfoINTEL;
      pConfiguration: ptr PerformanceConfigurationINTEL;
    ): Result {.cdecl.} =
  acquirePerformanceConfigurationINTELCage(device,pAcquireInfo,pConfiguration)

proc getPerformanceParameterINTEL*(
      device: Device;
      parameter: PerformanceParameterTypeINTEL;
      pValue: ptr PerformanceValueINTEL;
    ): Result {.cdecl.} =
  getPerformanceParameterINTELCage(device,parameter,pValue)

proc releasePerformanceConfigurationINTEL*(
      device: Device;
      configuration: PerformanceConfigurationINTEL;
    ): Result {.cdecl.} =
  releasePerformanceConfigurationINTELCage(device,configuration)

proc uninitializePerformanceApiINTEL*(
      device: Device;
    ): void {.cdecl.} =
  uninitializePerformanceApiINTELCage(device)

proc queueSetPerformanceConfigurationINTEL*(
      queue: Queue;
      configuration: PerformanceConfigurationINTEL;
    ): Result {.cdecl.} =
  queueSetPerformanceConfigurationINTELCage(queue,configuration)

proc cmdSetPerformanceMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceMarkerInfoINTEL;
    ): Result {.cdecl.} =
  cmdSetPerformanceMarkerINTELCage(commandBuffer,pMarkerInfo)

proc cmdSetPerformanceStreamMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceStreamMarkerInfoINTEL;
    ): Result {.cdecl.} =
  cmdSetPerformanceStreamMarkerINTELCage(commandBuffer,pMarkerInfo)

proc initializePerformanceApiINTEL*(
      device: Device;
      pInitializeInfo: ptr InitializePerformanceApiInfoINTEL;
    ): Result {.cdecl.} =
  initializePerformanceApiINTELCage(device,pInitializeInfo)


proc loadVK_INTEL_performance_query*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetPerformanceOverrideINTELCage << "vkCmdSetPerformanceOverrideINTEL"
  acquirePerformanceConfigurationINTELCage << "vkAcquirePerformanceConfigurationINTEL"
  getPerformanceParameterINTELCage << "vkGetPerformanceParameterINTEL"
  releasePerformanceConfigurationINTELCage << "vkReleasePerformanceConfigurationINTEL"
  uninitializePerformanceApiINTELCage << "vkUninitializePerformanceApiINTEL"
  queueSetPerformanceConfigurationINTELCage << "vkQueueSetPerformanceConfigurationINTEL"
  cmdSetPerformanceMarkerINTELCage << "vkCmdSetPerformanceMarkerINTEL"
  cmdSetPerformanceStreamMarkerINTELCage << "vkCmdSetPerformanceStreamMarkerINTEL"
  initializePerformanceApiINTELCage << "vkInitializePerformanceApiINTEL"