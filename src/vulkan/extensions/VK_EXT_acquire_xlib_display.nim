
import ../platform
import ../features/vk10
import VK_EXT_direct_mode_display


# type


const ExtAcquireXlibDisplayExtensionName* = "VK_EXT_acquire_xlib_display"
const ExtAcquireXlibDisplaySpecVersion* = 1
var # commands
  getRandROutputDisplayEXTCage: proc(physicalDevice: PhysicalDevice; dpy: ptr Display; rrOutput: RROutput; pDisplay: ptr DisplayKHR;): Result {.cdecl.}
  acquireXlibDisplayEXTCage: proc(physicalDevice: PhysicalDevice; dpy: ptr Display; display: DisplayKHR;): Result {.cdecl.}

proc getRandROutputDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      rrOutput: RROutput;
      pDisplay: ptr DisplayKHR;
    ): Result {.cdecl.} =
  getRandROutputDisplayEXTCage(physicalDevice,dpy,rrOutput,pDisplay)

proc acquireXlibDisplayEXT*(
      physicalDevice: PhysicalDevice;
      dpy: ptr Display;
      display: DisplayKHR;
    ): Result {.cdecl.} =
  acquireXlibDisplayEXTCage(physicalDevice,dpy,display)


proc loadVK_EXT_acquire_xlib_display*(instance: Instance) =
  instance.defineLoader(`<<`)

  getRandROutputDisplayEXTCage << "vkGetRandROutputDisplayEXT"
  acquireXlibDisplayEXTCage << "vkAcquireXlibDisplayEXT"