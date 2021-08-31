# Generated at 2021-08-31T05:19:02Z
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

var # command cages
  getMemoryFdKHRCage: proc(device: Device; pGetFdInfo: ptr MemoryGetFdInfoKHR; pFd: ptr int;): Result {.cdecl.}
  getMemoryFdPropertiesKHRCage: proc(device: Device; handleType: ExternalMemoryHandleTypeFlagBits; fd: int; pMemoryFdProperties: ptr MemoryFdPropertiesKHR;): Result {.cdecl.}
proc getMemoryFdKHR*(
      device: Device;
      pGetFdInfo: ptr MemoryGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl, discardable.} =
  getMemoryFdKHRCage(device,pGetFdInfo,pFd)
proc getMemoryFdPropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      fd: int;
      pMemoryFdProperties: ptr MemoryFdPropertiesKHR;
    ): Result {.cdecl, discardable.} =
  getMemoryFdPropertiesKHRCage(device,handleType,fd,pMemoryFdProperties)

proc loadVK_KHR_external_memory_fd*(instance: Instance) =
  instance.defineLoader(`<<`)

  getMemoryFdKHRCage << "vkGetMemoryFdKHR"
  getMemoryFdPropertiesKHRCage << "vkGetMemoryFdPropertiesKHR"