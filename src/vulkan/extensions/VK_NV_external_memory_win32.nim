# Generated at 2021-08-31T02:18:45Z
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

var # command cages
  getMemoryWin32HandleNVCage: proc(device: Device; memory: DeviceMemory; handleType: ExternalMemoryHandleTypeFlagsNV; pHandle: ptr Win32Handle;): Result {.cdecl.}
proc getMemoryWin32HandleNV*(
      device: Device;
      memory: DeviceMemory;
      handleType: ExternalMemoryHandleTypeFlagsNV;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, discardable.} =
  getMemoryWin32HandleNVCage(device,memory,handleType,pHandle)
proc loadVK_NV_external_memory_win32*(instance: Instance) =
  instance.defineLoader(`<<`)

  getMemoryWin32HandleNVCage << "vkGetMemoryWin32HandleNV"