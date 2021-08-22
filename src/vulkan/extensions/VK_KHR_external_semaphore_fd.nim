
import ../platform
import ../features/vk10
import VK_KHR_external_semaphore


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

const KhrExternalSemaphoreFdSpecVersion* = 1
const KhrExternalSemaphoreFdExtensionName* = "VK_KHR_external_semaphore_fd"
var # commands
  importSemaphoreFdKHRCage: proc(device: Device; pImportSemaphoreFdInfo: ptr ImportSemaphoreFdInfoKHR;): Result {.cdecl.}
  getSemaphoreFdKHRCage: proc(device: Device; pGetFdInfo: ptr SemaphoreGetFdInfoKHR; pFd: ptr int;): Result {.cdecl.}

proc importSemaphoreFdKHR*(
      device: Device;
      pImportSemaphoreFdInfo: ptr ImportSemaphoreFdInfoKHR;
    ): Result {.cdecl.} =
  importSemaphoreFdKHRCage(device,pImportSemaphoreFdInfo)

proc getSemaphoreFdKHR*(
      device: Device;
      pGetFdInfo: ptr SemaphoreGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl.} =
  getSemaphoreFdKHRCage(device,pGetFdInfo,pFd)


proc loadVK_KHR_external_semaphore_fd*(instance: Instance) =
  instance.defineLoader(`<<`)

  importSemaphoreFdKHRCage << "vkImportSemaphoreFdKHR"
  getSemaphoreFdKHRCage << "vkGetSemaphoreFdKHR"