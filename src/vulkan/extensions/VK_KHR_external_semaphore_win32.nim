# Generated at 2021-12-31T11:28:24Z
# VK_KHR_external_semaphore_win32

import ../platform

import ../features/vk11
import ./VK_KHR_external_semaphore
export VK_KHR_external_semaphore
prepareVulkanLibDef()

const
  KhrExternalSemaphoreWin32SpecVersion* = 1
  KhrExternalSemaphoreWin32ExtensionName* = "VK_KHR_external_semaphore_win32"

type
  ImportSemaphoreWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.importSemaphoreWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    flags* {.optional.}: SemaphoreImportFlags
    handleType*: ExternalSemaphoreHandleTypeFlagBits
    handle* {.optional.}: Win32Handle
    name* {.optional.}: LPCWSTR
  ExportSemaphoreWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.exportSemaphoreWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  D3D12FenceSubmitInfoKHR* = object
    sType* {.constant: (StructureType.d3d12FenceSubmitInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreValuesCount* {.optional.}: uint32
    pWaitSemaphoreValues* {.optional, length: waitSemaphoreValuesCount.}: arrPtr[uint64]
    signalSemaphoreValuesCount* {.optional.}: uint32
    pSignalSemaphoreValues* {.optional, length: signalSemaphoreValuesCount.}: arrPtr[uint64]
  SemaphoreGetWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.semaphoreGetWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    handleType*: ExternalSemaphoreHandleTypeFlagBits

proc importSemaphoreWin32HandleKHR*(
      device: Device;
      pImportSemaphoreWin32HandleInfo: ptr ImportSemaphoreWin32HandleInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkImportSemaphoreWin32HandleKHR", DeviceLevel).}
proc getSemaphoreWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr SemaphoreGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetSemaphoreWin32HandleKHR", DeviceLevel).}

proc loadAllVK_KHR_external_semaphore_win32*(instance: Instance) = instance.loadCommands:
  importSemaphoreWin32HandleKHR
  getSemaphoreWin32HandleKHR
proc loadVK_KHR_external_semaphore_win32*(device: Device) = device.loadCommands:
  importSemaphoreWin32HandleKHR
  getSemaphoreWin32HandleKHR
