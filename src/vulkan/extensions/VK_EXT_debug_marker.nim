# Generated at 2021-12-26T10:42:47Z
# VK_EXT_debug_marker

import ../platform

import ../features/vk10
import ./VK_EXT_debug_utils
export VK_EXT_debug_utils
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
    color* {.optional.}: array[4, float32]

proc debugMarkerSetObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugMarkerObjectTagInfoEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkDebugMarkerSetObjectTagEXT", DeviceLevel).}
proc debugMarkerSetObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugMarkerObjectNameInfoEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
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

proc loadAllVK_EXT_debug_marker*(instance: Instance) =
  instance.loadCommand debugMarkerSetObjectTagEXT
  instance.loadCommand debugMarkerSetObjectNameEXT
  instance.loadCommand cmdDebugMarkerBeginEXT
  instance.loadCommand cmdDebugMarkerEndEXT
  instance.loadCommand cmdDebugMarkerInsertEXT

proc loadVK_EXT_debug_marker*(device: Device) =
  device.loadCommand debugMarkerSetObjectTagEXT
  device.loadCommand debugMarkerSetObjectNameEXT
  device.loadCommand cmdDebugMarkerBeginEXT
  device.loadCommand cmdDebugMarkerEndEXT
  device.loadCommand cmdDebugMarkerInsertEXT

