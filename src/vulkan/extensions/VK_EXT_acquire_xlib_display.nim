# VK_EXT_acquire_xlib_display

import ../features/vk10
import VK_EXT_direct_mode_display
import ../platform
prepareVulkanLibDef()

const
  ExtAcquireXlibDisplaySpecVersion* = 1
  ExtAcquireXlibDisplayExtensionName* = "VK_EXT_acquire_xlib_display"

proc acquireXlibDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInitializationFailed],
      lazyload("vkAcquireXlibDisplayEXT", InstanceLevel).}
proc getRandROutputDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      rrOutput: RROutput;
      pDisplay: ptr DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkGetRandROutputDisplayEXT", InstanceLevel).}

proc loadAllVK_EXT_acquire_xlib_display*(instance: Instance) = instance.loadCommands:
  acquireXlibDisplayEXT
  getRandROutputDisplayEXT
proc loadVK_EXT_acquire_xlib_display*(instance: Instance) = instance.loadCommands:
  acquireXlibDisplayEXT
  getRandROutputDisplayEXT
