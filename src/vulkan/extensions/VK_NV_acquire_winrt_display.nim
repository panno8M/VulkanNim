# VK_NV_acquire_winrt_display

import ../features/vk10
import VK_EXT_direct_mode_display
import ../platform
prepareVulkanLibDef()

const
  NvAcquireWinrtDisplaySpecVersion* = 1
  NvAcquireWinrtDisplayExtensionName* = "VK_NV_acquire_winrt_display"

proc acquireWinrtDisplayNV*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorDeviceLost, Result.errorInitializationFailed],
      lazyload("vkAcquireWinrtDisplayNV", InstanceLevel).}
proc getWinrtDisplayNV*(
      physicalDevice: PhysicalDevice;
      deviceRelativeId: uint32;
      pDisplay: ptr DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorDeviceLost, Result.errorInitializationFailed],
      lazyload("vkGetWinrtDisplayNV", InstanceLevel).}

proc loadAllVK_NV_acquire_winrt_display*(instance: Instance) = instance.loadCommands:
  acquireWinrtDisplayNV
  getWinrtDisplayNV
proc loadVK_NV_acquire_winrt_display*(instance: Instance) = instance.loadCommands:
  acquireWinrtDisplayNV
  getWinrtDisplayNV
