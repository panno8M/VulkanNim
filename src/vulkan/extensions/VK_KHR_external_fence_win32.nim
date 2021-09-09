# Generated at 2021-09-09T01:49:36Z
# VK_KHR_external_fence_win32


import ../platform
import ../features/vk10
import ./VK_KHR_external_fence
export VK_KHR_external_fence

const
  KhrExternalFenceWin32SpecVersion* = 1
  KhrExternalFenceWin32ExtensionName* = "VK_KHR_external_fence_win32"

type
  ImportFenceWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    fence*: Fence
    flags*: FenceImportFlags
    handleType*: ExternalFenceHandleTypeFlagBits
    handle*: Win32Handle
    name*: LPCWSTR
  ExportFenceWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  FenceGetWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    fence*: Fence
    handleType*: ExternalFenceHandleTypeFlagBits

proc importFenceWin32HandleKHR*(
      device: Device;
      pImportFenceWin32HandleInfo: ptr ImportFenceWin32HandleInfoKHR;
    ): Result {.cdecl, lazyload("vkImportFenceWin32HandleKHR", DeviceLevel).}
proc getFenceWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr FenceGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, lazyload("vkGetFenceWin32HandleKHR", DeviceLevel).}

proc loadAllVK_KHR_external_fence_win32*(instance: Instance) =
  importFenceWin32HandleKHR.smartLoad(instance)
  getFenceWin32HandleKHR.smartLoad(instance)

proc loadVK_KHR_external_fence_win32*(device: Device) =
  importFenceWin32HandleKHR.smartLoad(device)
  getFenceWin32HandleKHR.smartLoad(device)

