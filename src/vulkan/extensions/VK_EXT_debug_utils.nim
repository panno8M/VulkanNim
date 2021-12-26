# Generated at 2021-12-26T10:16:13Z
# VK_EXT_debug_utils

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  ExtDebugUtilsSpecVersion* = 2
  ExtDebugUtilsExtensionName* = "VK_EXT_debug_utils"

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
    pQueueLabels* {.length: queueLabelCount.}: arrPtr[DebugUtilsLabelEXT]
    cmdBufLabelCount* {.optional.}: uint32
    pCmdBufLabels* {.length: cmdBufLabelCount.}: arrPtr[DebugUtilsLabelEXT]
    objectCount* {.optional.}: uint32
    pObjects* {.length: objectCount.}: arrPtr[DebugUtilsObjectNameInfoEXT]
  DebugUtilsMessengerCreateInfoEXT* = object
    sType* {.constant: (StructureType.debugUtilsMessengerCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DebugUtilsMessengerCreateFlagsEXT
    messageSeverity*: DebugUtilsMessageSeverityFlagsEXT
    messageType*: DebugUtilsMessageTypeFlagsEXT
    pfnUserCallback*: PFN_DebugUtilsMessengerCallbackEXT
    pUserData* {.optional.}: pointer
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
    pTag* {.length: tagSize.}: pointer

proc setDebugUtilsObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugUtilsObjectNameInfoEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkSetDebugUtilsObjectNameEXT", DeviceLevel).}
proc setDebugUtilsObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugUtilsObjectTagInfoEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkSetDebugUtilsObjectTagEXT", DeviceLevel).}
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
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkCreateDebugUtilsMessengerEXT", InstanceLevel).}
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
  instance.loadCommand setDebugUtilsObjectNameEXT
  instance.loadCommand setDebugUtilsObjectTagEXT
  instance.loadCommand queueBeginDebugUtilsLabelEXT
  instance.loadCommand queueEndDebugUtilsLabelEXT
  instance.loadCommand queueInsertDebugUtilsLabelEXT
  instance.loadCommand cmdBeginDebugUtilsLabelEXT
  instance.loadCommand cmdEndDebugUtilsLabelEXT
  instance.loadCommand cmdInsertDebugUtilsLabelEXT
  instance.loadCommand createDebugUtilsMessengerEXT
  instance.loadCommand destroyDebugUtilsMessengerEXT
  instance.loadCommand submitDebugUtilsMessageEXT

proc loadVK_EXT_debug_utils*(instance: Instance) =
  instance.loadCommand createDebugUtilsMessengerEXT
  instance.loadCommand destroyDebugUtilsMessengerEXT
  instance.loadCommand submitDebugUtilsMessageEXT

proc loadVK_EXT_debug_utils*(device: Device) =
  device.loadCommand setDebugUtilsObjectNameEXT
  device.loadCommand setDebugUtilsObjectTagEXT
  device.loadCommand queueBeginDebugUtilsLabelEXT
  device.loadCommand queueEndDebugUtilsLabelEXT
  device.loadCommand queueInsertDebugUtilsLabelEXT
  device.loadCommand cmdBeginDebugUtilsLabelEXT
  device.loadCommand cmdEndDebugUtilsLabelEXT
  device.loadCommand cmdInsertDebugUtilsLabelEXT

