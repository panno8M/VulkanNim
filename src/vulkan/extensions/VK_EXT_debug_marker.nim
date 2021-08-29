# Generated at 2021-08-29T04:29:38Z
# VK_EXT_debug_marker
# =================================

import ../platform
import ../features/vk10
import VK_EXT_debug_report


const
  ExtDebugMarkerSpecVersion* = 4
  ExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"

type
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
  DebugMarkerObjectNameInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: DebugReportObjectTypeEXT
    object*: uint64
    pObjectName*: cstring
  DebugMarkerObjectTagInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: DebugReportObjectTypeEXT
    object*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer
  DebugMarkerMarkerInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    pMarkerName*: cstring
    color*: array[4, float32]

DebugReportObjectTypeEXT.defineAliases:
  debugReportCallbackExtExt as debugReportExt # Backwards-compatible alias containing a typo
  validationCacheExtExt as validationCacheExt # Backwards-compatible alias containing a typo

var # commands
  debugMarkerSetObjectTagEXTCage: proc(device: Device; pTagInfo: ptr DebugMarkerObjectTagInfoEXT;): Result {.cdecl.}
  debugMarkerSetObjectNameEXTCage: proc(device: Device; pNameInfo: ptr DebugMarkerObjectNameInfoEXT;): Result {.cdecl.}
  cmdDebugMarkerBeginEXTCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;): void {.cdecl.}
  cmdDebugMarkerEndEXTCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}
  cmdDebugMarkerInsertEXTCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;): void {.cdecl.}
proc debugMarkerSetObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugMarkerObjectTagInfoEXT;
    ): Result {.cdecl, discardable.} =
  debugMarkerSetObjectTagEXTCage(device,pTagInfo)
proc debugMarkerSetObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugMarkerObjectNameInfoEXT;
    ): Result {.cdecl, discardable.} =
  debugMarkerSetObjectNameEXTCage(device,pNameInfo)
proc cmdDebugMarkerBeginEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl.} =
  cmdDebugMarkerBeginEXTCage(commandBuffer,pMarkerInfo)
proc cmdDebugMarkerEndEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl.} =
  cmdDebugMarkerEndEXTCage(commandBuffer)
proc cmdDebugMarkerInsertEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl.} =
  cmdDebugMarkerInsertEXTCage(commandBuffer,pMarkerInfo)
proc loadVK_EXT_debug_marker*(instance: Instance) =
  instance.defineLoader(`<<`)

  debugMarkerSetObjectTagEXTCage << "vkDebugMarkerSetObjectTagEXT"
  debugMarkerSetObjectNameEXTCage << "vkDebugMarkerSetObjectNameEXT"
  cmdDebugMarkerBeginEXTCage << "vkCmdDebugMarkerBeginEXT"
  cmdDebugMarkerEndEXTCage << "vkCmdDebugMarkerEndEXT"
  cmdDebugMarkerInsertEXTCage << "vkCmdDebugMarkerInsertEXT"
