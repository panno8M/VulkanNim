# Generated at 2021-10-02T09:29:44Z
# VK_EXT_acquire_xlib_display


import ../platform
import ../features/vk10
import ./VK_EXT_direct_mode_display
export VK_EXT_direct_mode_display

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
  acquireXlibDisplayEXT.load(instance)
  getRandROutputDisplayEXT.load(instance)

proc loadVK_EXT_acquire_xlib_display*(instance: Instance) =
  acquireXlibDisplayEXT.load(instance)
  getRandROutputDisplayEXT.load(instance)

