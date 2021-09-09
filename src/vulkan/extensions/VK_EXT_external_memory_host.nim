# Generated at 2021-09-09T01:49:36Z
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

proc getMemoryHostPointerPropertiesEXT*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      pHostPointer: pointer;
      pMemoryHostPointerProperties: ptr MemoryHostPointerPropertiesEXT;
    ): Result {.cdecl, lazyload("vkGetMemoryHostPointerPropertiesEXT", DeviceLevel).}

proc loadAllVK_EXT_external_memory_host*(instance: Instance) =
  getMemoryHostPointerPropertiesEXT.smartLoad(instance)

proc loadVK_EXT_external_memory_host*(device: Device) =
  getMemoryHostPointerPropertiesEXT.smartLoad(device)

