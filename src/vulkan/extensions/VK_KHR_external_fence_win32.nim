# VK_KHR_external_fence_win32

import ../features/vk10
import VK_KHR_external_fence
import ../platform
prepareVulkanLibDef()

const
  KhrExternalFenceWin32SpecVersion* = 1
  KhrExternalFenceWin32ExtensionName* = "VK_KHR_external_fence_win32"

type
  ImportFenceWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.importFenceWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    fence*: Fence
    flags* {.optional.}: FenceImportFlags
    handleType*: ExternalFenceHandleTypeFlagBits
    handle* {.optional.}: Win32Handle
    name* {.optional.}: LPCWSTR
  ExportFenceWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.exportFenceWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  FenceGetWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.fenceGetWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    fence*: Fence
    handleType*: ExternalFenceHandleTypeFlagBits

proc importFenceWin32HandleKHR*(
      device: Device;
      pImportFenceWin32HandleInfo: ptr ImportFenceWin32HandleInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkImportFenceWin32HandleKHR", DeviceLevel).}
proc getFenceWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr FenceGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetFenceWin32HandleKHR", DeviceLevel).}

proc loadAllVK_KHR_external_fence_win32*(instance: Instance) = instance.loadCommands:
  importFenceWin32HandleKHR
  getFenceWin32HandleKHR
proc loadVK_KHR_external_fence_win32*(device: Device) = device.loadCommands:
  importFenceWin32HandleKHR
  getFenceWin32HandleKHR
