# Generated at 2021-08-30T14:31:10Z
# VK_EXT_debug_report


import ../platform
import ../features/vk10

const
  ExtDebugReportSpecVersion* = 9
  ExtDebugReportExtensionName* = "VK_EXT_debug_report"

type
  HtDebugReportCallbackEXT = object of HandleType
  DebugReportCallbackEXT* = NonDispatchableHandle[HtDebugReportCallbackEXT]
  DebugReportCallbackEXT* = proc(
      flags: DebugReportFlagsEXT;
      objectType: DebugReportObjectTypeEXT;
      object: uint64;
      location: uint;
      messageCode: int32;
      pLayerPrefix: cstring;
      pMessage: cstring;
      pUserData: pointer;
    ): Bool32 {.cdecl.}
  DebugReportFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    informationExt = 0x00000001
    warningExt = 0x00000002
    performanceWarningExt = 0x00000004
    errorExt = 0x00000008
    debugExt = 0x00000010
  DebugReportFlagsEXT* = Flags[DebugReportFlagBitsEXT]
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
  DebugReportCallbackCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugReportFlagsEXT
    pfnCallback*: DebugReportCallbackEXT
    pUserData*: pointer

DebugReportObjectTypeEXT.defineAliases:
  debugReportCallbackExtExt as debugReportExt # Backwards-compatible alias containing a typo
  validationCacheExtExt as validationCacheExt # Backwards-compatible alias containing a typo

var # commands
  createDebugReportCallbackEXTCage: proc(instance: Instance; pCreateInfo: ptr DebugReportCallbackCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pCallback: ptr DebugReportCallbackEXT;): Result {.cdecl.}
  destroyDebugReportCallbackEXTCage: proc(instance: Instance; callback: DebugReportCallbackEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  debugReportMessageEXTCage: proc(instance: Instance; flags: DebugReportFlagsEXT; objectType: DebugReportObjectTypeEXT; object: uint64; location: uint; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring;): void {.cdecl.}
proc createDebugReportCallbackEXT*(
      instance: Instance;
      pCreateInfo: ptr DebugReportCallbackCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pCallback: ptr DebugReportCallbackEXT;
    ): Result {.cdecl, discardable.} =
  createDebugReportCallbackEXTCage(instance,pCreateInfo,pAllocator,pCallback)
proc destroyDebugReportCallbackEXT*(
      instance: Instance;
      callback: DebugReportCallbackEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDebugReportCallbackEXTCage(instance,callback,pAllocator)
proc debugReportMessageEXT*(
      instance: Instance;
      flags: DebugReportFlagsEXT;
      objectType: DebugReportObjectTypeEXT;
      object: uint64;
      location: uint;
      messageCode: int32;
      pLayerPrefix: cstring;
      pMessage: cstring;
    ): void {.cdecl.} =
  debugReportMessageEXTCage(instance,flags,objectType,object,location,messageCode,pLayerPrefix,pMessage)
StructureType.defineAliases:
  debugReportCallbackCreateInfoExt as debugReportCreateInfoExt

proc loadVK_EXT_debug_report*(instance: Instance) =
  instance.defineLoader(`<<`)

  createDebugReportCallbackEXTCage << "vkCreateDebugReportCallbackEXT"
  destroyDebugReportCallbackEXTCage << "vkDestroyDebugReportCallbackEXT"
  debugReportMessageEXTCage << "vkDebugReportMessageEXT"