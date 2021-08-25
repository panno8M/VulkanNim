
import ../platform
import ../features/vk10
import VK_KHR_external_fence


type
  FenceGetFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    fence*: Fence
    handleType*: ExternalFenceHandleTypeFlagBits
  ImportFenceFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    fence*: Fence
    flags*: FenceImportFlags
    handleType*: ExternalFenceHandleTypeFlagBits
    fd*: int

const KhrExternalFenceFdExtensionName* = "VK_KHR_external_fence_fd"
const KhrExternalFenceFdSpecVersion* = 1
var # commands
  importFenceFdKHRCage: proc(device: Device; pImportFenceFdInfo: ptr ImportFenceFdInfoKHR;): Result {.cdecl.}
  getFenceFdKHRCage: proc(device: Device; pGetFdInfo: ptr FenceGetFdInfoKHR; pFd: ptr int;): Result {.cdecl.}

proc importFenceFdKHR*(
      device: Device;
      pImportFenceFdInfo: ptr ImportFenceFdInfoKHR;
    ): Result {.cdecl, discardable.} =
  importFenceFdKHRCage(device,pImportFenceFdInfo)

proc getFenceFdKHR*(
      device: Device;
      pGetFdInfo: ptr FenceGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl, discardable.} =
  getFenceFdKHRCage(device,pGetFdInfo,pFd)


proc loadVK_KHR_external_fence_fd*(instance: Instance) =
  instance.defineLoader(`<<`)

  importFenceFdKHRCage << "vkImportFenceFdKHR"
  getFenceFdKHRCage << "vkGetFenceFdKHR"