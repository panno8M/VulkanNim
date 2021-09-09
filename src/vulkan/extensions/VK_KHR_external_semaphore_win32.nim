# Generated at 2021-09-09T01:49:36Z
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

proc importSemaphoreWin32HandleKHR*(
      device: Device;
      pImportSemaphoreWin32HandleInfo: ptr ImportSemaphoreWin32HandleInfoKHR;
    ): Result {.cdecl, lazyload("vkImportSemaphoreWin32HandleKHR", DeviceLevel).}
proc getSemaphoreWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr SemaphoreGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl, lazyload("vkGetSemaphoreWin32HandleKHR", DeviceLevel).}

proc loadAllVK_KHR_external_semaphore_win32*(instance: Instance) =
  importSemaphoreWin32HandleKHR.smartLoad(instance)
  getSemaphoreWin32HandleKHR.smartLoad(instance)

proc loadVK_KHR_external_semaphore_win32*(device: Device) =
  importSemaphoreWin32HandleKHR.smartLoad(device)
  getSemaphoreWin32HandleKHR.smartLoad(device)

