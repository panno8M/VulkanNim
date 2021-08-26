
import ../platform
import ../features/vk10




type
  DebugUtilsMessengerCallbackEXT* = proc(
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
      pUserData: pointer;
    ): ptr Bool32 {.cdecl.}
  DebugUtilsLabelEXT* = object
    sType*: StructureType
    pNext*: pointer
    pLabelName*: cstring
    color*: array[4, float32]
  DebugUtilsMessageSeverityFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    VerboseBitExt = 0x00000001
    InfoBitExt = 0x00000010
    WarningBitExt = 0x00000100
    ErrorBitExt = 0x00001000
  DebugUtilsMessageSeverityFlagsEXT* = distinct Flags
  DebugUtilsMessageTypeFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    GeneralBitExt = 0x00000001
    ValidationBitExt = 0x00000002
    PerformanceBitExt = 0x00000004
  DebugUtilsMessageTypeFlagsEXT* = distinct Flags
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
  DebugUtilsMessengerCallbackDataFlagsEXT* = distinct Flags
  DebugUtilsMessengerCreateFlagsEXT* = distinct Flags
  DebugUtilsMessengerCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugUtilsMessengerCreateFlagsEXT
    messageSeverity*: DebugUtilsMessageSeverityFlagsEXT
    messageType*: DebugUtilsMessageTypeFlagsEXT
    pfnUserCallback*: DebugUtilsMessengerCallbackEXT
    pUserData*: pointer
  DebugUtilsMessengerEXT* = distinct NonDispatchableHandle
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