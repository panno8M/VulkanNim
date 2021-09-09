# Generated at 2021-09-09T01:49:36Z
# VK_KHR_external_semaphore_fd


import ../platform
import ../features/vk11
import ./VK_KHR_external_semaphore
export VK_KHR_external_semaphore

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

proc importSemaphoreFdKHR*(
      device: Device;
      pImportSemaphoreFdInfo: ptr ImportSemaphoreFdInfoKHR;
    ): Result {.cdecl, lazyload("vkImportSemaphoreFdKHR", DeviceLevel).}
proc getSemaphoreFdKHR*(
      device: Device;
      pGetFdInfo: ptr SemaphoreGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl, lazyload("vkGetSemaphoreFdKHR", DeviceLevel).}

proc loadAllVK_KHR_external_semaphore_fd*(instance: Instance) =
  importSemaphoreFdKHR.smartLoad(instance)
  getSemaphoreFdKHR.smartLoad(instance)

proc loadVK_KHR_external_semaphore_fd*(device: Device) =
  importSemaphoreFdKHR.smartLoad(device)
  getSemaphoreFdKHR.smartLoad(device)

