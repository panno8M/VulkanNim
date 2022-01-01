# VK_NV_external_memory_win32

import ../features/vk10
import VK_NV_external_memory
import ../platform
prepareVulkanLibDef()

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
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetMemoryWin32HandleNV", DeviceLevel).}

proc loadAllVK_NV_external_memory_win32*(instance: Instance) = instance.loadCommands:
  getMemoryWin32HandleNV
proc loadVK_NV_external_memory_win32*(device: Device) = device.loadCommands:
  getMemoryWin32HandleNV
