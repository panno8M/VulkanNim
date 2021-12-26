# Generated at 2021-12-26T10:16:14Z
# VK_KHR_external_memory_win32

import ../platform

import ../features/vk11
import ./VK_KHR_external_memory
export VK_KHR_external_memory

prepareVulkanLibDef()

const
  KhrExternalMemoryWin32SpecVersion* = 1
  KhrExternalMemoryWin32ExtensionName* = "VK_KHR_external_memory_win32"

type
  ImportMemoryWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.importMemoryWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagBits
    handle* {.optional.}: Win32Handle
    name* {.optional.}: LPCWSTR
  ExportMemoryWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.exportMemoryWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  MemoryWin32HandlePropertiesKHR* = object
    sType* {.constant: (StructureType.memoryWin32HandlePropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
  MemoryGetWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.memoryGetWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits

proc getMemoryWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr MemoryGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetMemoryWin32HandleKHR", DeviceLevel).}
proc getMemoryWin32HandlePropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      handle: Win32Handle;
      pMemoryWin32HandleProperties: ptr MemoryWin32HandlePropertiesKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle),
      lazyload("vkGetMemoryWin32HandlePropertiesKHR", DeviceLevel).}

proc loadAllVK_KHR_external_memory_win32*(instance: Instance) =
  instance.loadCommand getMemoryWin32HandleKHR
  instance.loadCommand getMemoryWin32HandlePropertiesKHR

proc loadVK_KHR_external_memory_win32*(device: Device) =
  device.loadCommand getMemoryWin32HandleKHR
  device.loadCommand getMemoryWin32HandlePropertiesKHR

