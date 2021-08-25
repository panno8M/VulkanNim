
import ../platform
import ../features/vk10
import VK_EXT_debug_report


type
  DebugMarkerMarkerInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    pMarkerName*: cstring
    color*: array[4, float32]
  DebugMarkerObjectNameInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: DebugReportObjectTypeEXT
    object*: uint64
    pObjectName*: cstring
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
  DebugMarkerObjectTagInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: DebugReportObjectTypeEXT
    object*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer

DebugReportObjectTypeEXT.defineAlias(DebugReport, DebugReportCallbackExt) # Backwards-compatible alias containing a typo
DebugReportObjectTypeEXT.defineAlias(ValidationCache, ValidationCacheExt) # Backwards-compatible alias containing a typo
const ExtDebugMarkerSpecVersion* = 4
const ExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"
var # commands
  cmdDebugMarkerBeginEXTCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;): void {.cdecl.}
  debugMarkerSetObjectTagEXTCage: proc(device: Device; pTagInfo: ptr DebugMarkerObjectTagInfoEXT;): Result {.cdecl.}
  debugMarkerSetObjectNameEXTCage: proc(device: Device; pNameInfo: ptr DebugMarkerObjectNameInfoEXT;): Result {.cdecl.}
  cmdDebugMarkerEndEXTCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}
  cmdDebugMarkerInsertEXTCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;): void {.cdecl.}

proc cmdDebugMarkerBeginEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl.} =
  cmdDebugMarkerBeginEXTCage(commandBuffer,pMarkerInfo)

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

  cmdDebugMarkerBeginEXTCage << "vkCmdDebugMarkerBeginEXT"
  debugMarkerSetObjectTagEXTCage << "vkDebugMarkerSetObjectTagEXT"
  debugMarkerSetObjectNameEXTCage << "vkDebugMarkerSetObjectNameEXT"
  cmdDebugMarkerEndEXTCage << "vkCmdDebugMarkerEndEXT"
  cmdDebugMarkerInsertEXTCage << "vkCmdDebugMarkerInsertEXT"