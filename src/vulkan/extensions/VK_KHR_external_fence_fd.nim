# Generated at 2021-10-02T09:29:45Z
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
    sType* {.constant: (StructureType.importFenceFdInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    fence*: Fence
    flags* {.optional.}: FenceImportFlags
    handleType*: ExternalFenceHandleTypeFlagBits
    fd*: int
  FenceGetFdInfoKHR* = object
    sType* {.constant: (StructureType.fenceGetFdInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    fence*: Fence
    handleType*: ExternalFenceHandleTypeFlagBits

proc importFenceFdKHR*(
      device: Device;
      pImportFenceFdInfo: ptr ImportFenceFdInfoKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle),
      lazyload("vkImportFenceFdKHR", DeviceLevel).}
proc getFenceFdKHR*(
      device: Device;
      pGetFdInfo: ptr FenceGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetFenceFdKHR", DeviceLevel).}

proc loadAllVK_KHR_external_fence_fd*(instance: Instance) =
  importFenceFdKHR.load(instance)
  getFenceFdKHR.load(instance)

proc loadVK_KHR_external_fence_fd*(device: Device) =
  importFenceFdKHR.load(device)
  getFenceFdKHR.load(device)

