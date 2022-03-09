# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_KHR_shared_presentable_image

import ../tools
const
  # VK_KHR_shared_presentable_image
  KhrSharedPresentableImageSpecVersion* = 1
  KhrSharedPresentableImageExtensionName* = "VK_KHR_shared_presentable_image"


# VK_KHR_shared_presentable_image
# ===============================
proc getSwapchainStatusKHR*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.lazyload("vkGetSwapchainStatusKHR", DeviceLevel),
      successCodes: @[Result.success, Result.suboptimalKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost, Result.errorOutOfDateKhr, Result.errorSurfaceLostKhr, Result.errorFullScreenExclusiveModeLostExt].}


proc loadAllVK_KHR_shared_presentable_image*(instance: Instance) = instance.loadCommands:
  getSwapchainStatusKHR
proc loadVK_KHR_shared_presentable_image*(device: Device) = device.loadCommands:
  getSwapchainStatusKHR