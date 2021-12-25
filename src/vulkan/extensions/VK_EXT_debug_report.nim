# Generated at 2021-12-25T14:19:30Z
# VK_EXT_debug_report

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtDebugReportSpecVersion* = 9
  ExtDebugReportExtensionName* = "VK_EXT_debug_report"

type
  HtDebugReportCallbackEXT* = object of HandleType
  DebugReportCallbackEXT* = NonDispatchableHandle[HtDebugReportCallbackEXT]
  PFN_DebugReportCallbackEXT* = proc(
      flags: DebugReportFlagsEXT;
      objectType: DebugReportObjectTypeEXT;
      `object`: uint64;
      location: uint;
      messageCode: int32;
      pLayerPrefix: cstring;
      pMessage: cstring;
      pUserData: pointer;
    ): Bool32 {.cdecl.}
  DebugReportCallbackCreateInfoEXT* = object
    sType* {.constant: (StructureType.debugReportCallbackCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DebugReportFlagsEXT
    pfnCallback*: PFN_DebugReportCallbackEXT
    pUserData* {.optional.}: pointer

proc createDebugReportCallbackEXT*(
      instance: Instance;
      pCreateInfo: ptr DebugReportCallbackCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pCallback: ptr DebugReportCallbackEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkCreateDebugReportCallbackEXT", InstanceLevel).}
proc destroyDebugReportCallbackEXT*(
      instance: Instance;
      callback = default(DebugReportCallbackEXT);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyDebugReportCallbackEXT", InstanceLevel).}
proc debugReportMessageEXT*(
      instance: Instance;
      flags: DebugReportFlagsEXT;
      objectType: DebugReportObjectTypeEXT;
      `object`: uint64;
      location: uint;
      messageCode: int32;
      pLayerPrefix: cstring;
      pMessage: cstring;
    ): void {.cdecl, lazyload("vkDebugReportMessageEXT", InstanceLevel).}

proc loadAllVK_EXT_debug_report*(instance: Instance) =
  instance.loadCommand createDebugReportCallbackEXT
  instance.loadCommand destroyDebugReportCallbackEXT
  instance.loadCommand debugReportMessageEXT

proc loadVK_EXT_debug_report*(instance: Instance) =
  instance.loadCommand createDebugReportCallbackEXT
  instance.loadCommand destroyDebugReportCallbackEXT
  instance.loadCommand debugReportMessageEXT

