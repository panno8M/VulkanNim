# Generated at 2021-12-26T10:16:13Z
# VK_KHR_external_fence_win32

import ../platform

import ../features/vk10
import ./VK_KHR_external_fence
export VK_KHR_external_fence

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
    handleType* {.optional.}: ExternalFenceHandleTypeFlagBits
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
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle),
      lazyload("vkImportFenceWin32HandleKHR", DeviceLevel).}
proc getFenceWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr FenceGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetFenceWin32HandleKHR", DeviceLevel).}

proc loadAllVK_KHR_external_fence_win32*(instance: Instance) =
  instance.loadCommand importFenceWin32HandleKHR
  instance.loadCommand getFenceWin32HandleKHR

proc loadVK_KHR_external_fence_win32*(device: Device) =
  device.loadCommand importFenceWin32HandleKHR
  device.loadCommand getFenceWin32HandleKHR

