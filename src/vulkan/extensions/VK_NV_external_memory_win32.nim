# Generated at 2021-09-09T01:49:36Z
# VK_NV_external_memory_win32


import ../platform
import ../features/vk10
import ./VK_NV_external_memory
export VK_NV_external_memory

const
  NvExternalMemoryWin32SpecVersion* = 1
  NvExternalMemoryWin32ExtensionName* = "VK_NV_external_memory_win32"

type
  ImportMemoryWin32HandleInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagsNV
    handle*: Win32Handle
  ExportMemoryWin32HandleInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD

proc getMemoryWin32HandleNV*(
      device: Device;
      memory: DeviceMemory;
      handleType: ExternalMemoryHandleTypeFlagsNV;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, lazyload("vkGetMemoryWin32HandleNV", DeviceLevel).}

proc loadAllVK_NV_external_memory_win32*(instance: Instance) =
  getMemoryWin32HandleNV.smartLoad(instance)

proc loadVK_NV_external_memory_win32*(device: Device) =
  getMemoryWin32HandleNV.smartLoad(device)

