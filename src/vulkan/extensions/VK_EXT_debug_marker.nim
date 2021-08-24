
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
    ): Result {.cdecl.} =
  debugMarkerSetObjectTagEXTCage(device,pTagInfo)

proc debugMarkerSetObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugMarkerObjectNameInfoEXT;
    ): Result {.cdecl.} =
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