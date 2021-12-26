# Generated at 2021-12-26T10:16:14Z
# VK_INTEL_performance_query

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  IntelPerformanceQuerySpecVersion* = 2
  IntelPerformanceQueryExtensionName* = "VK_INTEL_performance_query"

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

proc initializePerformanceApiINTEL*(
      device: Device;
      pInitializeInfo: ptr InitializePerformanceApiInfoINTEL;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkInitializePerformanceApiINTEL", DeviceLevel).}
proc uninitializePerformanceApiINTEL*(
      device: Device;
    ): void {.cdecl, lazyload("vkUninitializePerformanceApiINTEL", DeviceLevel).}
proc cmdSetPerformanceMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceMarkerInfoINTEL;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkCmdSetPerformanceMarkerINTEL", DeviceLevel).}
proc cmdSetPerformanceStreamMarkerINTEL*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr PerformanceStreamMarkerInfoINTEL;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkCmdSetPerformanceStreamMarkerINTEL", DeviceLevel).}
proc cmdSetPerformanceOverrideINTEL*(
      commandBuffer: CommandBuffer;
      pOverrideInfo: ptr PerformanceOverrideInfoINTEL;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkCmdSetPerformanceOverrideINTEL", DeviceLevel).}
proc acquirePerformanceConfigurationINTEL*(
      device: Device;
      pAcquireInfo: ptr PerformanceConfigurationAcquireInfoINTEL;
      pConfiguration: ptr PerformanceConfigurationINTEL;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkAcquirePerformanceConfigurationINTEL", DeviceLevel).}
proc releasePerformanceConfigurationINTEL*(
      device: Device;
      configuration = default(PerformanceConfigurationINTEL);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkReleasePerformanceConfigurationINTEL", DeviceLevel).}
proc queueSetPerformanceConfigurationINTEL*(
      queue: Queue;
      configuration: PerformanceConfigurationINTEL;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkQueueSetPerformanceConfigurationINTEL", DeviceLevel).}
proc getPerformanceParameterINTEL*(
      device: Device;
      parameter: PerformanceParameterTypeINTEL;
      pValue: ptr PerformanceValueINTEL;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetPerformanceParameterINTEL", DeviceLevel).}

proc loadAllVK_INTEL_performance_query*(instance: Instance) =
  instance.loadCommand initializePerformanceApiINTEL
  instance.loadCommand uninitializePerformanceApiINTEL
  instance.loadCommand cmdSetPerformanceMarkerINTEL
  instance.loadCommand cmdSetPerformanceStreamMarkerINTEL
  instance.loadCommand cmdSetPerformanceOverrideINTEL
  instance.loadCommand acquirePerformanceConfigurationINTEL
  instance.loadCommand releasePerformanceConfigurationINTEL
  instance.loadCommand queueSetPerformanceConfigurationINTEL
  instance.loadCommand getPerformanceParameterINTEL

proc loadVK_INTEL_performance_query*(device: Device) =
  device.loadCommand initializePerformanceApiINTEL
  device.loadCommand uninitializePerformanceApiINTEL
  device.loadCommand cmdSetPerformanceMarkerINTEL
  device.loadCommand cmdSetPerformanceStreamMarkerINTEL
  device.loadCommand cmdSetPerformanceOverrideINTEL
  device.loadCommand acquirePerformanceConfigurationINTEL
  device.loadCommand releasePerformanceConfigurationINTEL
  device.loadCommand queueSetPerformanceConfigurationINTEL
  device.loadCommand getPerformanceParameterINTEL

