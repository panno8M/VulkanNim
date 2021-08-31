# Generated at 2021-08-31T05:19:03Z
# VK_EXT_external_memory_host


import ../platform
import ../features/vk11
import ./VK_KHR_external_memory
export VK_KHR_external_memory

const
  ExtExternalMemoryHostSpecVersion* = 1
  ExtExternalMemoryHostExtensionName* = "VK_EXT_external_memory_host"

type
  ImportMemoryHostPointerInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
    pHostPointer*: pointer
  MemoryHostPointerPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    memoryTypeBits*: uint32
  PhysicalDeviceExternalMemoryHostPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    minImportedHostPointerAlignment*: DeviceSize

var # command cages
  getMemoryHostPointerPropertiesEXTCage: proc(device: Device; handleType: ExternalMemoryHandleTypeFlagBits; pHostPointer: pointer; pMemoryHostPointerProperties: ptr MemoryHostPointerPropertiesEXT;): Result {.cdecl.}
proc getMemoryHostPointerPropertiesEXT*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      pHostPointer: pointer;
      pMemoryHostPointerProperties: ptr MemoryHostPointerPropertiesEXT;
    ): Result {.cdecl, discardable.} =
  getMemoryHostPointerPropertiesEXTCage(device,handleType,pHostPointer,pMemoryHostPointerProperties)

proc loadVK_EXT_external_memory_host*(instance: Instance) =
  instance.defineLoader(`<<`)

  getMemoryHostPointerPropertiesEXTCage << "vkGetMemoryHostPointerPropertiesEXT"