# Generated at 2021-09-09T01:49:36Z
# VK_KHR_external_memory_win32


import ../platform
import ../features/vk11
import ./VK_KHR_external_memory
export VK_KHR_external_memory

const
  KhrExternalMemoryWin32SpecVersion* = 1
  KhrExternalMemoryWin32ExtensionName* = "VK_KHR_external_memory_win32"

type
  ImportMemoryWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
    handle*: Win32Handle
    name*: LPCWSTR
  ExportMemoryWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  MemoryWin32HandlePropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    memoryTypeBits*: uint32
  MemoryGetWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits

proc getMemoryWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr MemoryGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, lazyload("vkGetMemoryWin32HandleKHR", DeviceLevel).}
proc getMemoryWin32HandlePropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      handle: Win32Handle;
      pMemoryWin32HandleProperties: ptr MemoryWin32HandlePropertiesKHR;
    ): Result {.cdecl, lazyload("vkGetMemoryWin32HandlePropertiesKHR", DeviceLevel).}

proc loadAllVK_KHR_external_memory_win32*(instance: Instance) =
  getMemoryWin32HandleKHR.smartLoad(instance)
  getMemoryWin32HandlePropertiesKHR.smartLoad(instance)

proc loadVK_KHR_external_memory_win32*(device: Device) =
  getMemoryWin32HandleKHR.smartLoad(device)
  getMemoryWin32HandlePropertiesKHR.smartLoad(device)

