# Generated at 2021-12-30T16:35:41Z
# VK_EXT_acquire_xlib_display

import ../platform

import ../features/vk10
import ./VK_EXT_direct_mode_display
export VK_EXT_direct_mode_display
prepareVulkanLibDef()

const
  ExtAcquireXlibDisplaySpecVersion* = 1
  ExtAcquireXlibDisplayExtensionName* = "VK_EXT_acquire_xlib_display"

proc acquireXlibDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInitializationFailed),
      lazyload("vkAcquireXlibDisplayEXT", InstanceLevel).}
proc getRandROutputDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      rrOutput: RROutput;
      pDisplay: ptr DisplayKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkGetRandROutputDisplayEXT", InstanceLevel).}

proc loadAllVK_EXT_acquire_xlib_display*(instance: Instance) =
  instance.loadCommand acquireXlibDisplayEXT
  instance.loadCommand getRandROutputDisplayEXT
proc loadVK_EXT_acquire_xlib_display*(instance: Instance) =
  instance.loadCommand acquireXlibDisplayEXT
  instance.loadCommand getRandROutputDisplayEXT
