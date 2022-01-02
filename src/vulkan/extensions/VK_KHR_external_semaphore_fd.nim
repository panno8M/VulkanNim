# VK_KHR_external_semaphore_fd

import ../features/vk10
import ../platform
prepareVulkanLibDef()

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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkImportSemaphoreFdKHR", DeviceLevel).}
proc getSemaphoreFdKHR*(
      device: Device;
      pGetFdInfo: ptr SemaphoreGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetSemaphoreFdKHR", DeviceLevel).}

proc loadAllVK_KHR_external_semaphore_fd*(instance: Instance) = instance.loadCommands:
  importSemaphoreFdKHR
  getSemaphoreFdKHR
proc loadVK_KHR_external_semaphore_fd*(device: Device) = device.loadCommands:
  importSemaphoreFdKHR
  getSemaphoreFdKHR
