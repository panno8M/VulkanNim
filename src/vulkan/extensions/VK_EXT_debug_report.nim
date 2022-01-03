# VK_EXT_debug_report

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtDebugReportSpecVersion* = 10
  ExtDebugReportExtensionName* = "VK_EXT_debug_report"

type
  PFN_DebugReportCallbackEXT* = proc(
      flags: DebugReportFlagsEXT;
      objectType: DebugReportObjectTypeEXT;
      `object`: uint64;
      location: uint32;
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
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
      location: uint32;
      messageCode: int32;
      pLayerPrefix: cstring;
      pMessage: cstring;
    ): void {.cdecl, lazyload("vkDebugReportMessageEXT", InstanceLevel).}

proc loadAllVK_EXT_debug_report*(instance: Instance) = instance.loadCommands:
  createDebugReportCallbackEXT
  destroyDebugReportCallbackEXT
  debugReportMessageEXT
proc loadVK_EXT_debug_report*(instance: Instance) = instance.loadCommands:
  createDebugReportCallbackEXT
  destroyDebugReportCallbackEXT
  debugReportMessageEXT
