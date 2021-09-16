# Generated at 2021-09-16T07:11:43Z
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
    sType* {.constant: (StructureType.importMemoryWin32HandleInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagsNV
    handle* {.optional.}: Win32Handle
  ExportMemoryWin32HandleInfoNV* = object
    sType* {.constant: (StructureType.exportMemoryWin32HandleInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess* {.optional.}: DWORD

proc getMemoryWin32HandleNV*(
      device: Device;
      memory: DeviceMemory;
      handleType: ExternalMemoryHandleTypeFlagsNV;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, lazyload("vkGetMemoryWin32HandleNV", DeviceLevel).}

proc loadAllVK_NV_external_memory_win32*(instance: Instance) =
  getMemoryWin32HandleNV.load(instance)

proc loadVK_NV_external_memory_win32*(device: Device) =
  getMemoryWin32HandleNV.load(device)

