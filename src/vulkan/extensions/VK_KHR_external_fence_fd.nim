# Generated at 2021-08-30T14:31:10Z
# VK_KHR_external_fence_fd


import ../platform
import ../features/vk10
import ./VK_KHR_external_fence

const
  KhrExternalFenceFdSpecVersion* = 1
  KhrExternalFenceFdExtensionName* = "VK_KHR_external_fence_fd"

type
  ImportFenceFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    fence*: Fence
    flags*: FenceImportFlags
    handleType*: ExternalFenceHandleTypeFlagBits
    fd*: int
  FenceGetFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    fence*: Fence
    handleType*: ExternalFenceHandleTypeFlagBits

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