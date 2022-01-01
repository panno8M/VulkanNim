# VK_KHR_external_fence_fd

import ../features/vk10
import VK_KHR_external_fence
import ../platform
prepareVulkanLibDef()

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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkImportFenceFdKHR", DeviceLevel).}
proc getFenceFdKHR*(
      device: Device;
      pGetFdInfo: ptr FenceGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetFenceFdKHR", DeviceLevel).}

proc loadAllVK_KHR_external_fence_fd*(instance: Instance) = instance.loadCommands:
  importFenceFdKHR
  getFenceFdKHR
proc loadVK_KHR_external_fence_fd*(device: Device) = device.loadCommands:
  importFenceFdKHR
  getFenceFdKHR
