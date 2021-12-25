# Generated at 2021-12-25T14:19:30Z
# VK_KHR_external_memory_fd

import ../platform
import ../features/vk10
import ./VK_KHR_external_memory
export VK_KHR_external_memory

prepareVulkanLibDef()

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
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetMemoryFdKHR", DeviceLevel).}
proc getMemoryFdPropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      fd: int;
      pMemoryFdProperties: ptr MemoryFdPropertiesKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle),
      lazyload("vkGetMemoryFdPropertiesKHR", DeviceLevel).}

proc loadAllVK_KHR_external_memory_fd*(instance: Instance) =
  instance.loadCommand getMemoryFdKHR
  instance.loadCommand getMemoryFdPropertiesKHR

proc loadVK_KHR_external_memory_fd*(device: Device) =
  device.loadCommand getMemoryFdKHR
  device.loadCommand getMemoryFdPropertiesKHR

