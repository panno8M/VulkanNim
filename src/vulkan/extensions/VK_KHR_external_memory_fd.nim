# Generated at 2021-09-09T01:49:36Z
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
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
    fd*: int
  MemoryFdPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    memoryTypeBits*: uint32
  MemoryGetFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
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
  getMemoryFdKHR.smartLoad(instance)
  getMemoryFdPropertiesKHR.smartLoad(instance)

proc loadVK_KHR_external_memory_fd*(device: Device) =
  getMemoryFdKHR.smartLoad(device)
  getMemoryFdPropertiesKHR.smartLoad(device)

