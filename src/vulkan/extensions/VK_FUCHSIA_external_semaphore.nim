# Generated at 2021-12-26T16:57:02Z
# VK_FUCHSIA_external_semaphore

import ../platform

import ../features/vk10
import ./VK_KHR_external_semaphore_capabilities
import ./VK_KHR_external_semaphore
export VK_KHR_external_semaphore_capabilities
export VK_KHR_external_semaphore
prepareVulkanLibDef()

const
  FuchsiaExternalSemaphoreSpecVersion* = 1
  FuchsiaExternalSemaphoreExtensionName* = "VK_FUCHSIA_external_semaphore"

type
  ImportSemaphoreZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.importSemaphoreZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    flags* {.optional.}: SemaphoreImportFlags
    handleType*: ExternalSemaphoreHandleTypeFlagBits
    zirconHandle*: zx_handle_t
  SemaphoreGetZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.semaphoreGetZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    handleType*: ExternalSemaphoreHandleTypeFlagBits

proc importSemaphoreZirconHandleFUCHSIA*(
      device: Device;
      pImportSemaphoreZirconHandleInfo: ptr ImportSemaphoreZirconHandleInfoFUCHSIA;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle),
      lazyload("vkImportSemaphoreZirconHandleFUCHSIA", DeviceLevel).}
proc getSemaphoreZirconHandleFUCHSIA*(
      device: Device;
      pGetZirconHandleInfo: ptr SemaphoreGetZirconHandleInfoFUCHSIA;
      pZirconHandle: ptr zx_handle_t;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetSemaphoreZirconHandleFUCHSIA", DeviceLevel).}

proc loadAllVK_FUCHSIA_external_semaphore*(instance: Instance) =
  instance.loadCommand importSemaphoreZirconHandleFUCHSIA
  instance.loadCommand getSemaphoreZirconHandleFUCHSIA

proc loadVK_FUCHSIA_external_semaphore*(device: Device) =
  device.loadCommand importSemaphoreZirconHandleFUCHSIA
  device.loadCommand getSemaphoreZirconHandleFUCHSIA

