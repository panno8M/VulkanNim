# Generated at 2021-08-31T05:19:02Z
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

var # command cages
  importFenceWin32HandleKHRCage: proc(device: Device; pImportFenceWin32HandleInfo: ptr ImportFenceWin32HandleInfoKHR;): Result {.cdecl.}
  getFenceWin32HandleKHRCage: proc(device: Device; pGetWin32HandleInfo: ptr FenceGetWin32HandleInfoKHR; pHandle: ptr Win32Handle;): Result {.cdecl.}
proc importFenceWin32HandleKHR*(
      device: Device;
      pImportFenceWin32HandleInfo: ptr ImportFenceWin32HandleInfoKHR;
    ): Result {.cdecl, discardable.} =
  importFenceWin32HandleKHRCage(device,pImportFenceWin32HandleInfo)
proc getFenceWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr FenceGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, discardable.} =
  getFenceWin32HandleKHRCage(device,pGetWin32HandleInfo,pHandle)

proc loadVK_KHR_external_fence_win32*(instance: Instance) =
  instance.defineLoader(`<<`)

  importFenceWin32HandleKHRCage << "vkImportFenceWin32HandleKHR"
  getFenceWin32HandleKHRCage << "vkGetFenceWin32HandleKHR"