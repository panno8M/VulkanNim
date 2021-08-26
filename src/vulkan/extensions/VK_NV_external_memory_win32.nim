
import ../platform
import ../features/vk10
import VK_NV_external_memory




type
  ImportMemoryWin32HandleInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagsNV
    handle*: HANDLE
  ExportMemoryWin32HandleInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD

var # commands
  getMemoryWin32HandleNVCage: proc(device: Device; memory: DeviceMemory; handleType: ExternalMemoryHandleTypeFlagsNV; pHandle: ptr HANDLE;): Result {.cdecl.}
proc getMemoryWin32HandleNV*(
      device: Device;
      memory: DeviceMemory;
      handleType: ExternalMemoryHandleTypeFlagsNV;
      pHandle: ptr HANDLE;
    ): Result {.cdecl, discardable.} =
  getMemoryWin32HandleNVCage(device,memory,handleType,pHandle)
proc loadVK_NV_external_memory_win32*(instance: Instance) =
  instance.defineLoader(`<<`)

  getMemoryWin32HandleNVCage << "vkGetMemoryWin32HandleNV"