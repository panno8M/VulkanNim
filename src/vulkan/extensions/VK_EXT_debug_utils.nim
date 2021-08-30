# Generated at 2021-08-30T01:26:11Z
# VK_EXT_debug_utils
# =================================

import ../platform
import ../features/vk10


const
  ExtDebugUtilsSpecVersion* = 2
  ExtDebugUtilsExtensionName* = "VK_EXT_debug_utils"

type
  DebugUtilsMessengerCallbackEXT* = proc(
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
      pUserData: pointer;
    ): Bool32 {.cdecl.}
  DebugUtilsLabelEXT* = object
    sType*: StructureType
    pNext*: pointer
    pLabelName*: cstring
    color*: array[4, float32]
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
  DebugUtilsMessengerCallbackDataEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugUtilsMessengerCallbackDataFlagsEXT
    pMessageIdName*: cstring
    messageIdNumber*: int32
    pMessage*: cstring
    queueLabelCount*: uint32
    pQueueLabels*: ptr DebugUtilsLabelEXT
    cmdBufLabelCount*: uint32
    pCmdBufLabels*: ptr DebugUtilsLabelEXT
    objectCount*: uint32
    pObjects*: ptr DebugUtilsObjectNameInfoEXT
  DebugUtilsMessengerCallbackDataFlagsEXT* = Flags[distinct UnusedEnum]
  DebugUtilsMessengerCreateFlagsEXT* = Flags[distinct UnusedEnum]
  DebugUtilsMessengerCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugUtilsMessengerCreateFlagsEXT
    messageSeverity*: DebugUtilsMessageSeverityFlagsEXT
    messageType*: DebugUtilsMessageTypeFlagsEXT
    pfnUserCallback*: DebugUtilsMessengerCallbackEXT
    pUserData*: pointer
  HtDebugUtilsMessengerEXT = object of HandleType
  DebugUtilsMessengerEXT* = NonDispatchableHandle[HtDebugUtilsMessengerEXT]
  DebugUtilsObjectNameInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: ObjectType
    objectHandle*: uint64
    pObjectName*: cstring
  DebugUtilsObjectTagInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: ObjectType
    objectHandle*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer

var # commands
  setDebugUtilsObjectNameEXTCage: proc(device: Device; pNameInfo: ptr DebugUtilsObjectNameInfoEXT;): Result {.cdecl.}
  setDebugUtilsObjectTagEXTCage: proc(device: Device; pTagInfo: ptr DebugUtilsObjectTagInfoEXT;): Result {.cdecl.}
  queueBeginDebugUtilsLabelEXTCage: proc(queue: Queue; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}
  queueEndDebugUtilsLabelEXTCage: proc(queue: Queue;): void {.cdecl.}
  queueInsertDebugUtilsLabelEXTCage: proc(queue: Queue; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}
  cmdBeginDebugUtilsLabelEXTCage: proc(commandBuffer: CommandBuffer; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}
  cmdEndDebugUtilsLabelEXTCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}
  cmdInsertDebugUtilsLabelEXTCage: proc(commandBuffer: CommandBuffer; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}
  createDebugUtilsMessengerEXTCage: proc(instance: Instance; pCreateInfo: ptr DebugUtilsMessengerCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pMessenger: ptr DebugUtilsMessengerEXT;): Result {.cdecl.}
  destroyDebugUtilsMessengerEXTCage: proc(instance: Instance; messenger: DebugUtilsMessengerEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  submitDebugUtilsMessageEXTCage: proc(instance: Instance; messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT; messageTypes: DebugUtilsMessageTypeFlagsEXT; pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;): void {.cdecl.}
proc setDebugUtilsObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugUtilsObjectNameInfoEXT;
    ): Result {.cdecl, discardable.} =
  setDebugUtilsObjectNameEXTCage(device,pNameInfo)
proc setDebugUtilsObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugUtilsObjectTagInfoEXT;
    ): Result {.cdecl, discardable.} =
  setDebugUtilsObjectTagEXTCage(device,pTagInfo)
proc queueBeginDebugUtilsLabelEXT*(
      queue: Queue;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  queueBeginDebugUtilsLabelEXTCage(queue,pLabelInfo)
proc queueEndDebugUtilsLabelEXT*(
      queue: Queue;
    ): void {.cdecl.} =
  queueEndDebugUtilsLabelEXTCage(queue)
proc queueInsertDebugUtilsLabelEXT*(
      queue: Queue;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  queueInsertDebugUtilsLabelEXTCage(queue,pLabelInfo)
proc cmdBeginDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  cmdBeginDebugUtilsLabelEXTCage(commandBuffer,pLabelInfo)
proc cmdEndDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl.} =
  cmdEndDebugUtilsLabelEXTCage(commandBuffer)
proc cmdInsertDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  cmdInsertDebugUtilsLabelEXTCage(commandBuffer,pLabelInfo)
proc createDebugUtilsMessengerEXT*(
      instance: Instance;
      pCreateInfo: ptr DebugUtilsMessengerCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pMessenger: ptr DebugUtilsMessengerEXT;
    ): Result {.cdecl, discardable.} =
  createDebugUtilsMessengerEXTCage(instance,pCreateInfo,pAllocator,pMessenger)
proc destroyDebugUtilsMessengerEXT*(
      instance: Instance;
      messenger: DebugUtilsMessengerEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDebugUtilsMessengerEXTCage(instance,messenger,pAllocator)
proc submitDebugUtilsMessageEXT*(
      instance: Instance;
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
    ): void {.cdecl.} =
  submitDebugUtilsMessageEXTCage(instance,messageSeverity,messageTypes,pCallbackData)
proc loadVK_EXT_debug_utils*(instance: Instance) =
  instance.defineLoader(`<<`)

  setDebugUtilsObjectNameEXTCage << "vkSetDebugUtilsObjectNameEXT"
  setDebugUtilsObjectTagEXTCage << "vkSetDebugUtilsObjectTagEXT"
  queueBeginDebugUtilsLabelEXTCage << "vkQueueBeginDebugUtilsLabelEXT"
  queueEndDebugUtilsLabelEXTCage << "vkQueueEndDebugUtilsLabelEXT"
  queueInsertDebugUtilsLabelEXTCage << "vkQueueInsertDebugUtilsLabelEXT"
  cmdBeginDebugUtilsLabelEXTCage << "vkCmdBeginDebugUtilsLabelEXT"
  cmdEndDebugUtilsLabelEXTCage << "vkCmdEndDebugUtilsLabelEXT"
  cmdInsertDebugUtilsLabelEXTCage << "vkCmdInsertDebugUtilsLabelEXT"
  createDebugUtilsMessengerEXTCage << "vkCreateDebugUtilsMessengerEXT"
  destroyDebugUtilsMessengerEXTCage << "vkDestroyDebugUtilsMessengerEXT"
  submitDebugUtilsMessageEXTCage << "vkSubmitDebugUtilsMessageEXT"
