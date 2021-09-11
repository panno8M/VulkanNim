# Generated at 2021-09-10T05:27:58Z
# VK_EXT_debug_marker


import ../platform
import ../features/vk10
import ./VK_EXT_debug_report
import ./VK_EXT_debug_utils
export VK_EXT_debug_report
export VK_EXT_debug_utils

const
  ExtDebugMarkerSpecVersion* = 4
  ExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"

type # enums and bitmasks
  DebugReportObjectTypeEXT* {.size: sizeof(int32), pure.} = enum
    unknownExt = 0
    instanceExt = 1
    physicalDeviceExt = 2
    deviceExt = 3
    queueExt = 4
    semaphoreExt = 5
    commandBufferExt = 6
    fenceExt = 7
    deviceMemoryExt = 8
    bufferExt = 9
    imageExt = 10
    eventExt = 11
    queryPoolExt = 12
    bufferViewExt = 13
    imageViewExt = 14
    shaderModuleExt = 15
    pipelineCacheExt = 16
    pipelineLayoutExt = 17
    renderPassExt = 18
    pipelineExt = 19
    descriptorSetLayoutExt = 20
    samplerExt = 21
    descriptorPoolExt = 22
    descriptorSetExt = 23
    framebufferExt = 24
    commandPoolExt = 25
    surfaceKhrExt = 26
    swapchainKhrExt = 27
    debugReportCallbackExtExt = 28
    displayKhrExt = 29
    displayModeKhrExt = 30
    validationCacheExtExt = 33
    # Provided by VK_EXT_debug_report
    descriptorUpdateTemplateExt = 1000085000
    # Provided by VK_EXT_debug_report
    samplerYcbcrConversionExt = 1000156000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureKhrExt = 1000165000

type
  DebugMarkerObjectNameInfoEXT* = object
    sType* {.constant: (StructureType.debugMarkerObjectNameInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    objectType*: DebugReportObjectTypeEXT
    `object`*: uint64
    pObjectName*: cstring
  DebugMarkerObjectTagInfoEXT* = object
    sType* {.constant: (StructureType.debugMarkerObjectTagInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    objectType*: DebugReportObjectTypeEXT
    `object`*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer
  DebugMarkerMarkerInfoEXT* = object
    sType* {.constant: (StructureType.debugMarkerMarkerInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pMarkerName*: cstring
    color* {.optional.}: array[4, float32]

DebugReportObjectTypeEXT.defineAliases:
  debugReportCallbackExtExt as debugReportExt # Backwards-compatible alias containing a typo
  validationCacheExtExt as validationCacheExt # Backwards-compatible alias containing a typo

proc debugMarkerSetObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugMarkerObjectTagInfoEXT;
    ): Result {.cdecl, lazyload("vkDebugMarkerSetObjectTagEXT", DeviceLevel).}
proc debugMarkerSetObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugMarkerObjectNameInfoEXT;
    ): Result {.cdecl, lazyload("vkDebugMarkerSetObjectNameEXT", DeviceLevel).}
proc cmdDebugMarkerBeginEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl, lazyload("vkCmdDebugMarkerBeginEXT", DeviceLevel).}
proc cmdDebugMarkerEndEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdDebugMarkerEndEXT", DeviceLevel).}
proc cmdDebugMarkerInsertEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl, lazyload("vkCmdDebugMarkerInsertEXT", DeviceLevel).}

proc loadAllVK_EXT_debug_marker*(instance: Instance) =
  debugMarkerSetObjectTagEXT.smartLoad(instance)
  debugMarkerSetObjectNameEXT.smartLoad(instance)
  cmdDebugMarkerBeginEXT.smartLoad(instance)
  cmdDebugMarkerEndEXT.smartLoad(instance)
  cmdDebugMarkerInsertEXT.smartLoad(instance)

proc loadVK_EXT_debug_marker*(device: Device) =
  debugMarkerSetObjectTagEXT.smartLoad(device)
  debugMarkerSetObjectNameEXT.smartLoad(device)
  cmdDebugMarkerBeginEXT.smartLoad(device)
  cmdDebugMarkerEndEXT.smartLoad(device)
  cmdDebugMarkerInsertEXT.smartLoad(device)

