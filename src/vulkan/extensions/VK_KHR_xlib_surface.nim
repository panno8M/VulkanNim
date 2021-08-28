# Generated at 2021-08-28T12:28:00Z
# VK_KHR_xlib_surface
# =================================

import ../platform
import ../features/vk10
import VK_KHR_surface


const
  KhrXlibSurfaceSpecVersion* = 6
  KhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"

type
  XlibSurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]
  XlibSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: XlibSurfaceCreateFlagsKHR
    dpy*: ptr Display
    window*: Window

var # commands
  createXlibSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr XlibSurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getPhysicalDeviceXlibPresentationSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; dpy: ptr Display; visualID: VisualID;): Bool32 {.cdecl.}
proc createXlibSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr XlibSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createXlibSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)
proc getPhysicalDeviceXlibPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dpy: ptr Display;
      visualID: VisualID;
    ): Bool32 {.cdecl.} =
  getPhysicalDeviceXlibPresentationSupportKHRCage(physicalDevice,queueFamilyIndex,dpy,visualID)
proc loadVK_KHR_xlib_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createXlibSurfaceKHRCage << "vkCreateXlibSurfaceKHR"
  getPhysicalDeviceXlibPresentationSupportKHRCage << "vkGetPhysicalDeviceXlibPresentationSupportKHR"
