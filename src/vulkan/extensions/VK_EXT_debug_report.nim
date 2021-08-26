
import ../platform
import ../features/vk10




type
  DebugReportCallbackEXT* = distinct NonDispatchableHandle
  DebugReportCallbackEXT* = proc(
      flags: DebugReportFlagsEXT;
      objectType: DebugReportObjectTypeEXT;
      object: uint64;
      location: uint;
      messageCode: int32;
      pLayerPrefix: cstring;
      pMessage: cstring;
      pUserData: pointer;
    ): ptr Bool32 {.cdecl.}
  DebugReportFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    InformationBitExt = 0x00000001
    WarningBitExt = 0x00000002
    PerformanceWarningBitExt = 0x00000004
    ErrorBitExt = 0x00000008
    DebugBitExt = 0x00000010
  DebugReportFlagsEXT* = distinct Flags
  DebugReportObjectTypeEXT* {.size: sizeof(int32), pure.} = enum
    UnknownExt = 0
    InstanceExt = 1
    PhysicalDeviceExt = 2
    DeviceExt = 3
    QueueExt = 4
    SemaphoreExt = 5
    CommandBufferExt = 6
    FenceExt = 7
    DeviceMemoryExt = 8
    BufferExt = 9
    ImageExt = 10
    EventExt = 11
    QueryPoolExt = 12
    BufferViewExt = 13
    ImageViewExt = 14
    ShaderModuleExt = 15
    PipelineCacheExt = 16
    PipelineLayoutExt = 17
    RenderPassExt = 18
    PipelineExt = 19
    DescriptorSetLayoutExt = 20
    SamplerExt = 21
    DescriptorPoolExt = 22
    DescriptorSetExt = 23
    FramebufferExt = 24
    CommandPoolExt = 25
    SurfaceKhrExt = 26
    SwapchainKhrExt = 27
    DebugReportCallbackExtExt = 28
    DisplayKhrExt = 29
    DisplayModeKhrExt = 30
    ValidationCacheExtExt = 33
    # Provided by VK_EXT_debug_report
    DescriptorUpdateTemplateExt = 100000850000
    # Provided by VK_EXT_debug_report
    SamplerYcbcrConversionExt = 100001560000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureKhrExt = 100001650000
  DebugReportCallbackCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugReportFlagsEXT
    pfnCallback*: DebugReportCallbackEXT
    pUserData*: pointer

DebugReportObjectTypeEXT.defineAlias(DebugReportExt, DebugReportCallbackExtExt) # Backwards-compatible alias containing a typo
DebugReportObjectTypeEXT.defineAlias(ValidationCacheExt, ValidationCacheExtExt) # Backwards-compatible alias containing a typo
# Provided by VK_KHR_descriptor_update_template
DebugReportObjectTypeEXT.defineAlias(DescriptorUpdateTemplateKhrExt, DescriptorUpdateTemplateExt)
# Provided by VK_KHR_sampler_ycbcr_conversion
DebugReportObjectTypeEXT.defineAlias(SamplerYcbcrConversionKhrExt, SamplerYcbcrConversionExt)
# Provided by VK_NV_ray_tracing
DebugReportObjectTypeEXT.defineAlias(AccelerationStructureNvExt, AccelerationStructureKhrExt)

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
proc loadVK_EXT_debug_report*(instance: Instance) =
  instance.defineLoader(`<<`)

  createDebugReportCallbackEXTCage << "vkCreateDebugReportCallbackEXT"
  destroyDebugReportCallbackEXTCage << "vkDestroyDebugReportCallbackEXT"
  debugReportMessageEXTCage << "vkDebugReportMessageEXT"