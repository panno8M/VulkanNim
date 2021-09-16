# Generated at 2021-09-12T04:58:23Z
# VK_KHR_external_memory_fd


import ../platform
import ../features/vk10
import ./VK_KHR_external_memory
export VK_KHR_external_memory

const
  KhrExternalMemoryFdSpecVersion* = 1
  KhrExternalMemoryFdExtensionName* = "VK_KHR_external_memory_fd"

type
  ImportMemoryFdInfoKHR* = object
    sType* {.constant: (StructureType.importMemoryFdInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagBits
    fd*: int
  MemoryFdPropertiesKHR* = object
    sType* {.constant: (StructureType.memoryFdPropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
  MemoryGetFdInfoKHR* = object
    sType* {.constant: (StructureType.memoryGetFdInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits

proc getMemoryFdKHR*(
      device: Device;
      pGetFdInfo: ptr MemoryGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl, lazyload("vkGetMemoryFdKHR", DeviceLevel).}
proc getMemoryFdPropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      fd: int;
      pMemoryFdProperties: ptr MemoryFdPropertiesKHR;
    ): Result {.cdecl, lazyload("vkGetMemoryFdPropertiesKHR", DeviceLevel).}

proc loadAllVK_KHR_external_memory_fd*(instance: Instance) =
  getMemoryFdKHR.load(instance)
  getMemoryFdPropertiesKHR.load(instance)

proc loadVK_KHR_external_memory_fd*(device: Device) =
  getMemoryFdKHR.load(device)
  getMemoryFdPropertiesKHR.load(device)

