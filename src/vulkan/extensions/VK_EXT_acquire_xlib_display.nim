# Generated at 2021-08-30T22:51:48Z
# VK_EXT_acquire_xlib_display


import ../platform
import ../features/vk10
import ./VK_EXT_direct_mode_display

const
  ExtAcquireXlibDisplaySpecVersion* = 1
  ExtAcquireXlibDisplayExtensionName* = "VK_EXT_acquire_xlib_display"

var # command cages
  acquireXlibDisplayEXTCage: proc(physicalDevice: PhysicalDevice; dpy: ptr Display; display: DisplayKHR;): Result {.cdecl.}
  getRandROutputDisplayEXTCage: proc(physicalDevice: PhysicalDevice; dpy: ptr Display; rrOutput: RROutput; pDisplay: ptr DisplayKHR;): Result {.cdecl.}
proc acquireXlibDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      display: DisplayKHR;
    ): Result {.cdecl, discardable.} =
  acquireXlibDisplayEXTCage(physicalDevice,dpy,display)
proc getRandROutputDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      rrOutput: RROutput;
      pDisplay: ptr DisplayKHR;
    ): Result {.cdecl, discardable.} =
  getRandROutputDisplayEXTCage(physicalDevice,dpy,rrOutput,pDisplay)
proc loadVK_EXT_acquire_xlib_display*(instance: Instance) =
  instance.defineLoader(`<<`)

  acquireXlibDisplayEXTCage << "vkAcquireXlibDisplayEXT"
  getRandROutputDisplayEXTCage << "vkGetRandROutputDisplayEXT"