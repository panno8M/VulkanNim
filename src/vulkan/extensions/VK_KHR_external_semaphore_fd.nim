# Generated at 2021-10-02T09:29:45Z
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
    sType* {.constant: (StructureType.importSemaphoreFdInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    flags* {.optional.}: SemaphoreImportFlags
    handleType*: ExternalSemaphoreHandleTypeFlagBits
    fd*: int
  SemaphoreGetFdInfoKHR* = object
    sType* {.constant: (StructureType.semaphoreGetFdInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    handleType*: ExternalSemaphoreHandleTypeFlagBits

proc importSemaphoreFdKHR*(
      device: Device;
      pImportSemaphoreFdInfo: ptr ImportSemaphoreFdInfoKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle),
      lazyload("vkImportSemaphoreFdKHR", DeviceLevel).}
proc getSemaphoreFdKHR*(
      device: Device;
      pGetFdInfo: ptr SemaphoreGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetSemaphoreFdKHR", DeviceLevel).}

proc loadAllVK_KHR_external_semaphore_fd*(instance: Instance) =
  importSemaphoreFdKHR.load(instance)
  getSemaphoreFdKHR.load(instance)

proc loadVK_KHR_external_semaphore_fd*(device: Device) =
  importSemaphoreFdKHR.load(device)
  getSemaphoreFdKHR.load(device)

