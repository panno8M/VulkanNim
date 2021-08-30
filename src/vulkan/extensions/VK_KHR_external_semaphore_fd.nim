# Generated at 2021-08-30T14:31:10Z
# VK_KHR_external_semaphore_fd


import ../platform
import ../features/vk10
import ./VK_KHR_external_semaphore

const
  KhrExternalSemaphoreFdSpecVersion* = 1
  KhrExternalSemaphoreFdExtensionName* = "VK_KHR_external_semaphore_fd"

type
  ImportSemaphoreFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    semaphore*: Semaphore
    flags*: SemaphoreImportFlags
    handleType*: ExternalSemaphoreHandleTypeFlagBits
    fd*: int
  SemaphoreGetFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    semaphore*: Semaphore
    handleType*: ExternalSemaphoreHandleTypeFlagBits

var # commands
  importSemaphoreFdKHRCage: proc(device: Device; pImportSemaphoreFdInfo: ptr ImportSemaphoreFdInfoKHR;): Result {.cdecl.}
  getSemaphoreFdKHRCage: proc(device: Device; pGetFdInfo: ptr SemaphoreGetFdInfoKHR; pFd: ptr int;): Result {.cdecl.}
proc importSemaphoreFdKHR*(
      device: Device;
      pImportSemaphoreFdInfo: ptr ImportSemaphoreFdInfoKHR;
    ): Result {.cdecl, discardable.} =
  importSemaphoreFdKHRCage(device,pImportSemaphoreFdInfo)
proc getSemaphoreFdKHR*(
      device: Device;
      pGetFdInfo: ptr SemaphoreGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl, discardable.} =
  getSemaphoreFdKHRCage(device,pGetFdInfo,pFd)
proc loadVK_KHR_external_semaphore_fd*(instance: Instance) =
  instance.defineLoader(`<<`)

  importSemaphoreFdKHRCage << "vkImportSemaphoreFdKHR"
  getSemaphoreFdKHRCage << "vkGetSemaphoreFdKHR"