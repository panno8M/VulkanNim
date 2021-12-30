# Generated at 2021-12-30T17:10:58Z
# VK_NV_acquire_winrt_display

import ../platform

import ../features/vk10
import ./VK_EXT_direct_mode_display
export VK_EXT_direct_mode_display
prepareVulkanLibDef()

const
  NvAcquireWinrtDisplaySpecVersion* = 1
  NvAcquireWinrtDisplayExtensionName* = "VK_NV_acquire_winrt_display"

proc acquireWinrtDisplayNV*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorDeviceLost, errorInitializationFailed),
      lazyload("vkAcquireWinrtDisplayNV", InstanceLevel).}
proc getWinrtDisplayNV*(
      physicalDevice: PhysicalDevice;
      deviceRelativeId: uint32;
      pDisplay: ptr DisplayKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorDeviceLost, errorInitializationFailed),
      lazyload("vkGetWinrtDisplayNV", InstanceLevel).}

proc loadAllVK_NV_acquire_winrt_display*(instance: Instance) = instance.loadCommands:
  acquireWinrtDisplayNV
  getWinrtDisplayNV
proc loadVK_NV_acquire_winrt_display*(instance: Instance) = instance.loadCommands:
  acquireWinrtDisplayNV
  getWinrtDisplayNV
