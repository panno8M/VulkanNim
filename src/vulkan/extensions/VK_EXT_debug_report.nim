
import ../platform
import ../features/vk10


type
  DebugReportObjectTypeEXT* {.size: sizeof(int32), pure.} = enum
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
  DebugReportFlagBitsEXT* = UnusedEnum
  DebugReportCallbackCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugReportFlagsEXT
    pfnCallback*: DebugReportCallbackEXT
    pUserData*: pointer
  DebugReportFlagsEXT* = distinct Flags

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