
import ../platform
import ../features/vk10


type
  DebugReportObjectTypeEXT* {.size: sizeof(int32), pure.} = enum
    Unknown = 0
    Instance = 1
    PhysicalDevice = 2
    Device = 3
    Queue = 4
    Semaphore = 5
    CommandBuffer = 6
    Fence = 7
    DeviceMemory = 8
    Buffer = 9
    Image = 10
    Event = 11
    QueryPool = 12
    BufferView = 13
    ImageView = 14
    ShaderModule = 15
    PipelineCache = 16
    PipelineLayout = 17
    RenderPass = 18
    Pipeline = 19
    DescriptorSetLayout = 20
    Sampler = 21
    DescriptorPool = 22
    DescriptorSet = 23
    Framebuffer = 24
    CommandPool = 25
    SurfaceKhr = 26
    SwapchainKhr = 27
    DebugReportCallbackExt = 28
    DisplayKhr = 29
    DisplayModeKhr = 30
    ValidationCacheExt = 33
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureKhr = 100001500000
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
  DebugReportCallbackEXT* = distinct NonDispatchableHandle
  DebugReportFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    Information = 0x00000001
    Warning = 0x00000002
    PerformanceWarning = 0x00000004
    Error = 0x00000008
    Debug = 0x00000010
  DebugReportCallbackCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugReportFlagsEXT
    pfnCallback*: DebugReportCallbackEXT
    pUserData*: pointer
  DebugReportFlagsEXT* = distinct Flags

DebugReportObjectTypeEXT.defineAlias(DebugReport, DebugReportCallbackExt) # Backwards-compatible alias containing a typo
DebugReportObjectTypeEXT.defineAlias(ValidationCache, ValidationCacheExt) # Backwards-compatible alias containing a typo
const ExtDebugReportSpecVersion* = 9
const ExtDebugReportExtensionName* = "VK_EXT_debug_report"
var # commands
  destroyDebugReportCallbackEXTCage: proc(instance: Instance; callback: DebugReportCallbackEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createDebugReportCallbackEXTCage: proc(instance: Instance; pCreateInfo: ptr DebugReportCallbackCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pCallback: ptr DebugReportCallbackEXT;): Result {.cdecl.}
  debugReportMessageEXTCage: proc(instance: Instance; flags: DebugReportFlagsEXT; objectType: DebugReportObjectTypeEXT; object: uint64; location: uint; messageCode: int32; pLayerPrefix: cstring; pMessage: cstring;): void {.cdecl.}

proc destroyDebugReportCallbackEXT*(
      instance: Instance;
      callback: DebugReportCallbackEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDebugReportCallbackEXTCage(instance,callback,pAllocator)

proc createDebugReportCallbackEXT*(
      instance: Instance;
      pCreateInfo: ptr DebugReportCallbackCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pCallback: ptr DebugReportCallbackEXT;
    ): Result {.cdecl.} =
  createDebugReportCallbackEXTCage(instance,pCreateInfo,pAllocator,pCallback)

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

  destroyDebugReportCallbackEXTCage << "vkDestroyDebugReportCallbackEXT"
  createDebugReportCallbackEXTCage << "vkCreateDebugReportCallbackEXT"
  debugReportMessageEXTCage << "vkDebugReportMessageEXT"