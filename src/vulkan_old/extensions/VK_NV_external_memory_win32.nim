# Generated at 2021-10-24T09:33:17Z
# VK_NV_external_memory_win32

import ../platform
import ../features/vk10
import ./VK_NV_external_memory
export VK_NV_external_memory

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
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetMemoryWin32HandleNV", DeviceLevel).}

proc loadAllVK_NV_external_memory_win32*(instance: Instance) =
  instance.loadCommand getMemoryWin32HandleNV

proc loadVK_NV_external_memory_win32*(device: Device) =
  device.loadCommand getMemoryWin32HandleNV

