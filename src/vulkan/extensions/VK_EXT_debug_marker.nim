# VK_EXT_debug_marker

import ../features/vk10
import VK_EXT_debug_report
import VK_EXT_debug_utils
import ../platform
prepareVulkanLibDef()

const
  ExtDebugMarkerSpecVersion* = 4
  ExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"

type
  DebugMarkerObjectNameInfoEXT* = object
    sType* {.constant: (StructureType.debugMarkerObjectNameInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    objectType*: DebugReportObjectTypeEXT
    `object`*: uint64
    pObjectName*: cstring
  DebugMarkerObjectTagInfoEXT* = object
    sType* {.constant: (StructureType.debugMarkerObjectTagInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    objectType*: DebugReportObjectTypeEXT
    `object`*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag* {.length: tagSize.}: pointer
  DebugMarkerMarkerInfoEXT* = object
    sType* {.constant: (StructureType.debugMarkerMarkerInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pMarkerName*: cstring
    color*: array[4, float32]

proc debugMarkerSetObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugMarkerObjectTagInfoEXT;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkDebugMarkerSetObjectTagEXT", DeviceLevel).}
proc debugMarkerSetObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugMarkerObjectNameInfoEXT;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkDebugMarkerSetObjectNameEXT", DeviceLevel).}
proc cmdDebugMarkerBeginEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl, lazyload("vkCmdDebugMarkerBeginEXT", DeviceLevel).}
proc cmdDebugMarkerEndEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdDebugMarkerEndEXT", DeviceLevel).}
proc cmdDebugMarkerInsertEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl, lazyload("vkCmdDebugMarkerInsertEXT", DeviceLevel).}

proc loadAllVK_EXT_debug_marker*(instance: Instance) = instance.loadCommands:
  debugMarkerSetObjectTagEXT
  debugMarkerSetObjectNameEXT
  cmdDebugMarkerBeginEXT
  cmdDebugMarkerEndEXT
  cmdDebugMarkerInsertEXT
proc loadVK_EXT_debug_marker*(device: Device) = device.loadCommands:
  debugMarkerSetObjectTagEXT
  debugMarkerSetObjectNameEXT
  cmdDebugMarkerBeginEXT
  cmdDebugMarkerEndEXT
  cmdDebugMarkerInsertEXT
