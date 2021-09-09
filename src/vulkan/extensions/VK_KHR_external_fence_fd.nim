# Generated at 2021-09-09T01:49:36Z
# VK_KHR_external_fence_fd


import ../platform
import ../features/vk10
import ./VK_KHR_external_fence
export VK_KHR_external_fence

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

proc importFenceFdKHR*(
      device: Device;
      pImportFenceFdInfo: ptr ImportFenceFdInfoKHR;
    ): Result {.cdecl, lazyload("vkImportFenceFdKHR", DeviceLevel).}
proc getFenceFdKHR*(
      device: Device;
      pGetFdInfo: ptr FenceGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl, lazyload("vkGetFenceFdKHR", DeviceLevel).}

proc loadAllVK_KHR_external_fence_fd*(instance: Instance) =
  importFenceFdKHR.smartLoad(instance)
  getFenceFdKHR.smartLoad(instance)

proc loadVK_KHR_external_fence_fd*(device: Device) =
  importFenceFdKHR.smartLoad(device)
  getFenceFdKHR.smartLoad(device)

