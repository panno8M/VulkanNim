# Generated at 2021-09-16T07:49:56Z
# VK_EXT_debug_utils


import ../platform
import ../features/vk10

const
  ExtDebugUtilsSpecVersion* = 2
  ExtDebugUtilsExtensionName* = "VK_EXT_debug_utils"

type # enums and bitmasks
  DebugUtilsMessageSeverityFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    verboseExt = 0x00000001
    infoExt = 0x00000010
    warningExt = 0x00000100
    errorExt = 0x00001000
  DebugUtilsMessageSeverityFlagsEXT* = Flags[DebugUtilsMessageSeverityFlagBitsEXT]
  DebugUtilsMessageTypeFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    generalExt = 0x00000001
    validationExt = 0x00000002
    performanceExt = 0x00000004
  DebugUtilsMessageTypeFlagsEXT* = Flags[DebugUtilsMessageTypeFlagBitsEXT]
  DebugUtilsMessengerCallbackDataFlagsEXT* = Flags[distinct UnusedEnum]
  DebugUtilsMessengerCreateFlagsEXT* = Flags[distinct UnusedEnum]

type
  PFN_DebugUtilsMessengerCallbackEXT* = proc(
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
      pUserData: pointer;
    ): Bool32 {.cdecl.}
  DebugUtilsLabelEXT* = object
    sType* {.constant: (StructureType.debugUtilsLabelExt).}: StructureType
    pNext* {.optional.}: pointer
    pLabelName*: cstring
    color* {.optional.}: array[4, float32]
  DebugUtilsMessengerCallbackDataEXT* = object
    sType* {.constant: (StructureType.debugUtilsMessengerCallbackDataExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DebugUtilsMessengerCallbackDataFlagsEXT
    pMessageIdName* {.optional.}: cstring
    messageIdNumber* {.optional.}: int32
    pMessage*: cstring
    queueLabelCount* {.optional.}: uint32
    pQueueLabels*: ptr DebugUtilsLabelEXT
    cmdBufLabelCount* {.optional.}: uint32
    pCmdBufLabels*: ptr DebugUtilsLabelEXT
    objectCount* {.optional.}: uint32
    pObjects*: ptr DebugUtilsObjectNameInfoEXT
  DebugUtilsMessengerCreateInfoEXT* = object
    sType* {.constant: (StructureType.debugUtilsMessengerCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DebugUtilsMessengerCreateFlagsEXT
    messageSeverity*: DebugUtilsMessageSeverityFlagsEXT
    messageType*: DebugUtilsMessageTypeFlagsEXT
    pfnUserCallback*: PFN_DebugUtilsMessengerCallbackEXT
    pUserData* {.optional.}: pointer
  HtDebugUtilsMessengerEXT = object of HandleType
  DebugUtilsMessengerEXT* = NonDispatchableHandle[HtDebugUtilsMessengerEXT]
  DebugUtilsObjectNameInfoEXT* = object
    sType* {.constant: (StructureType.debugUtilsObjectNameInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    objectType*: ObjectType
    objectHandle*: uint64
    pObjectName* {.optional.}: cstring
  DebugUtilsObjectTagInfoEXT* = object
    sType* {.constant: (StructureType.debugUtilsObjectTagInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    objectType*: ObjectType
    objectHandle*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer

proc setDebugUtilsObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugUtilsObjectNameInfoEXT;
    ): Result {.cdecl, lazyload("vkSetDebugUtilsObjectNameEXT", DeviceLevel).}
proc setDebugUtilsObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugUtilsObjectTagInfoEXT;
    ): Result {.cdecl, lazyload("vkSetDebugUtilsObjectTagEXT", DeviceLevel).}
proc queueBeginDebugUtilsLabelEXT*(
      queue: Queue;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl, lazyload("vkQueueBeginDebugUtilsLabelEXT", DeviceLevel).}
proc queueEndDebugUtilsLabelEXT*(
      queue: Queue;
    ): void {.cdecl, lazyload("vkQueueEndDebugUtilsLabelEXT", DeviceLevel).}
proc queueInsertDebugUtilsLabelEXT*(
      queue: Queue;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl, lazyload("vkQueueInsertDebugUtilsLabelEXT", DeviceLevel).}
proc cmdBeginDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl, lazyload("vkCmdBeginDebugUtilsLabelEXT", DeviceLevel).}
proc cmdEndDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdEndDebugUtilsLabelEXT", DeviceLevel).}
proc cmdInsertDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl, lazyload("vkCmdInsertDebugUtilsLabelEXT", DeviceLevel).}
proc createDebugUtilsMessengerEXT*(
      instance: Instance;
      pCreateInfo: ptr DebugUtilsMessengerCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pMessenger: ptr DebugUtilsMessengerEXT;
    ): Result {.cdecl, lazyload("vkCreateDebugUtilsMessengerEXT", InstanceLevel).}
proc destroyDebugUtilsMessengerEXT*(
      instance: Instance;
      messenger = default(DebugUtilsMessengerEXT);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyDebugUtilsMessengerEXT", InstanceLevel).}
proc submitDebugUtilsMessageEXT*(
      instance: Instance;
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
    ): void {.cdecl, lazyload("vkSubmitDebugUtilsMessageEXT", InstanceLevel).}

proc loadAllVK_EXT_debug_utils*(instance: Instance) =
  setDebugUtilsObjectNameEXT.load(instance)
  setDebugUtilsObjectTagEXT.load(instance)
  queueBeginDebugUtilsLabelEXT.load(instance)
  queueEndDebugUtilsLabelEXT.load(instance)
  queueInsertDebugUtilsLabelEXT.load(instance)
  cmdBeginDebugUtilsLabelEXT.load(instance)
  cmdEndDebugUtilsLabelEXT.load(instance)
  cmdInsertDebugUtilsLabelEXT.load(instance)
  createDebugUtilsMessengerEXT.load(instance)
  destroyDebugUtilsMessengerEXT.load(instance)
  submitDebugUtilsMessageEXT.load(instance)

proc loadVK_EXT_debug_utils*(instance: Instance) =
  createDebugUtilsMessengerEXT.load(instance)
  destroyDebugUtilsMessengerEXT.load(instance)
  submitDebugUtilsMessageEXT.load(instance)

proc loadVK_EXT_debug_utils*(device: Device) =
  setDebugUtilsObjectNameEXT.load(device)
  setDebugUtilsObjectTagEXT.load(device)
  queueBeginDebugUtilsLabelEXT.load(device)
  queueEndDebugUtilsLabelEXT.load(device)
  queueInsertDebugUtilsLabelEXT.load(device)
  cmdBeginDebugUtilsLabelEXT.load(device)
  cmdEndDebugUtilsLabelEXT.load(device)
  cmdInsertDebugUtilsLabelEXT.load(device)

