# Generated at 2021-08-31T02:22:37Z
# VK_KHR_external_semaphore_win32


import ../platform
import ../features/vk11
import ./VK_KHR_external_semaphore
export VK_KHR_external_semaphore

const
  KhrExternalSemaphoreWin32SpecVersion* = 1
  KhrExternalSemaphoreWin32ExtensionName* = "VK_KHR_external_semaphore_win32"

type
  ImportSemaphoreWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    semaphore*: Semaphore
    flags*: SemaphoreImportFlags
    handleType*: ExternalSemaphoreHandleTypeFlagBits
    handle*: Win32Handle
    name*: LPCWSTR
  ExportSemaphoreWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  D3D12FenceSubmitInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreValuesCount*: uint32
    pWaitSemaphoreValues*: ptr uint64
    signalSemaphoreValuesCount*: uint32
    pSignalSemaphoreValues*: ptr uint64
  SemaphoreGetWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    semaphore*: Semaphore
    handleType*: ExternalSemaphoreHandleTypeFlagBits

var # command cages
  importSemaphoreWin32HandleKHRCage: proc(device: Device; pImportSemaphoreWin32HandleInfo: ptr ImportSemaphoreWin32HandleInfoKHR;): Result {.cdecl.}
  getSemaphoreWin32HandleKHRCage: proc(device: Device; pGetWin32HandleInfo: ptr SemaphoreGetWin32HandleInfoKHR; pHandle: ptr Win32Handle;): Result {.cdecl.}
proc importSemaphoreWin32HandleKHR*(
      device: Device;
      pImportSemaphoreWin32HandleInfo: ptr ImportSemaphoreWin32HandleInfoKHR;
    ): Result {.cdecl, discardable.} =
  importSemaphoreWin32HandleKHRCage(device,pImportSemaphoreWin32HandleInfo)
proc getSemaphoreWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr SemaphoreGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, discardable.} =
  getSemaphoreWin32HandleKHRCage(device,pGetWin32HandleInfo,pHandle)
proc loadVK_KHR_external_semaphore_win32*(instance: Instance) =
  instance.defineLoader(`<<`)

  importSemaphoreWin32HandleKHRCage << "vkImportSemaphoreWin32HandleKHR"
  getSemaphoreWin32HandleKHRCage << "vkGetSemaphoreWin32HandleKHR"