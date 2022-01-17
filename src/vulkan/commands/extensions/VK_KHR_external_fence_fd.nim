# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_KHR_external_fence_fd

import ../tools
const
  # VK_KHR_external_fence_fd
  KhrExternalFenceFdSpecVersion* = 1
  KhrExternalFenceFdExtensionName* = "VK_KHR_external_fence_fd"


# VK_KHR_external_fence_fd
# ========================
proc importFenceFdKHR*(
      device: Device;
      pImportFenceFdInfo: ptr ImportFenceFdInfoKHR;
    ): Result {.lazyload("vkImportFenceFdKHR", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle].}
proc getFenceFdKHR*(
      device: Device;
      pGetFdInfo: ptr FenceGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.lazyload("vkGetFenceFdKHR", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory].}


proc loadAllVK_KHR_external_fence_fd*(instance: Instance) = instance.loadCommands:
  importFenceFdKHR
  getFenceFdKHR
proc loadVK_KHR_external_fence_fd*(device: Device) = device.loadCommands:
  importFenceFdKHR
  getFenceFdKHR