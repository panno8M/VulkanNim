
import ../platform
import ../features/vk10


type
  DebugUtilsMessageTypeFlagBitsEXT* = UnusedEnum
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
  DebugUtilsMessengerCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DebugUtilsMessengerCreateFlagsEXT
    messageSeverity*: DebugUtilsMessageSeverityFlagsEXT
    messageType*: DebugUtilsMessageTypeFlagsEXT
    pfnUserCallback*: DebugUtilsMessengerCallbackEXT
    pUserData*: pointer
  DebugUtilsMessengerCreateFlagsEXT* = distinct Flags
  DebugUtilsMessageSeverityFlagBitsEXT* = UnusedEnum
  DebugUtilsMessageSeverityFlagsEXT* = distinct Flags
  DebugUtilsLabelEXT* = object
    sType*: StructureType
    pNext*: pointer
    pLabelName*: cstring
    color*: array[4, float32]
  DebugUtilsObjectNameInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: ObjectType
    objectHandle*: uint64
    pObjectName*: cstring
  DebugUtilsMessengerCallbackEXT* = proc(
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
      pUserData: pointer;
    ): Bool32 {.cdecl.}
  DebugUtilsMessengerCallbackDataFlagsEXT* = distinct Flags
  DebugUtilsMessageTypeFlagsEXT* = distinct Flags
  DebugUtilsObjectTagInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: ObjectType
    objectHandle*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer
  DebugUtilsMessengerEXT* = distinct NonDispatchableHandle

const ExtDebugUtilsExtensionName* = "VK_EXT_debug_utils"
const ExtDebugUtilsSpecVersion* = 2
var # commands
  queueEndDebugUtilsLabelEXTCage: proc(queue: Queue;): void {.cdecl.}
  cmdEndDebugUtilsLabelEXTCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}
  queueBeginDebugUtilsLabelEXTCage: proc(queue: Queue; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}
  cmdBeginDebugUtilsLabelEXTCage: proc(commandBuffer: CommandBuffer; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}
  submitDebugUtilsMessageEXTCage: proc(instance: Instance; messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT; messageTypes: DebugUtilsMessageTypeFlagsEXT; pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;): void {.cdecl.}
  queueInsertDebugUtilsLabelEXTCage: proc(queue: Queue; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}
  destroyDebugUtilsMessengerEXTCage: proc(instance: Instance; messenger: DebugUtilsMessengerEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createDebugUtilsMessengerEXTCage: proc(instance: Instance; pCreateInfo: ptr DebugUtilsMessengerCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pMessenger: ptr DebugUtilsMessengerEXT;): Result {.cdecl.}
  setDebugUtilsObjectNameEXTCage: proc(device: Device; pNameInfo: ptr DebugUtilsObjectNameInfoEXT;): Result {.cdecl.}
  setDebugUtilsObjectTagEXTCage: proc(device: Device; pTagInfo: ptr DebugUtilsObjectTagInfoEXT;): Result {.cdecl.}
  cmdInsertDebugUtilsLabelEXTCage: proc(commandBuffer: CommandBuffer; pLabelInfo: ptr DebugUtilsLabelEXT;): void {.cdecl.}

proc queueEndDebugUtilsLabelEXT*(
      queue: Queue;
    ): void {.cdecl.} =
  queueEndDebugUtilsLabelEXTCage(queue)

proc cmdEndDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl.} =
  cmdEndDebugUtilsLabelEXTCage(commandBuffer)

proc queueBeginDebugUtilsLabelEXT*(
      queue: Queue;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  queueBeginDebugUtilsLabelEXTCage(queue,pLabelInfo)

proc cmdBeginDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  cmdBeginDebugUtilsLabelEXTCage(commandBuffer,pLabelInfo)

proc submitDebugUtilsMessageEXT*(
      instance: Instance;
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
    ): void {.cdecl.} =
  submitDebugUtilsMessageEXTCage(instance,messageSeverity,messageTypes,pCallbackData)

proc queueInsertDebugUtilsLabelEXT*(
      queue: Queue;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  queueInsertDebugUtilsLabelEXTCage(queue,pLabelInfo)

proc destroyDebugUtilsMessengerEXT*(
      instance: Instance;
      messenger: DebugUtilsMessengerEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDebugUtilsMessengerEXTCage(instance,messenger,pAllocator)

proc createDebugUtilsMessengerEXT*(
      instance: Instance;
      pCreateInfo: ptr DebugUtilsMessengerCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pMessenger: ptr DebugUtilsMessengerEXT;
    ): Result {.cdecl.} =
  createDebugUtilsMessengerEXTCage(instance,pCreateInfo,pAllocator,pMessenger)

proc setDebugUtilsObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugUtilsObjectNameInfoEXT;
    ): Result {.cdecl.} =
  setDebugUtilsObjectNameEXTCage(device,pNameInfo)

proc setDebugUtilsObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugUtilsObjectTagInfoEXT;
    ): Result {.cdecl.} =
  setDebugUtilsObjectTagEXTCage(device,pTagInfo)

proc cmdInsertDebugUtilsLabelEXT*(
      commandBuffer: CommandBuffer;
      pLabelInfo: ptr DebugUtilsLabelEXT;
    ): void {.cdecl.} =
  cmdInsertDebugUtilsLabelEXTCage(commandBuffer,pLabelInfo)


proc loadVK_EXT_debug_utils*(instance: Instance) =
  instance.defineLoader(`<<`)

  queueEndDebugUtilsLabelEXTCage << "vkQueueEndDebugUtilsLabelEXT"
  cmdEndDebugUtilsLabelEXTCage << "vkCmdEndDebugUtilsLabelEXT"
  queueBeginDebugUtilsLabelEXTCage << "vkQueueBeginDebugUtilsLabelEXT"
  cmdBeginDebugUtilsLabelEXTCage << "vkCmdBeginDebugUtilsLabelEXT"
  submitDebugUtilsMessageEXTCage << "vkSubmitDebugUtilsMessageEXT"
  queueInsertDebugUtilsLabelEXTCage << "vkQueueInsertDebugUtilsLabelEXT"
  destroyDebugUtilsMessengerEXTCage << "vkDestroyDebugUtilsMessengerEXT"
  createDebugUtilsMessengerEXTCage << "vkCreateDebugUtilsMessengerEXT"
  setDebugUtilsObjectNameEXTCage << "vkSetDebugUtilsObjectNameEXT"
  setDebugUtilsObjectTagEXTCage << "vkSetDebugUtilsObjectTagEXT"
  cmdInsertDebugUtilsLabelEXTCage << "vkCmdInsertDebugUtilsLabelEXT"