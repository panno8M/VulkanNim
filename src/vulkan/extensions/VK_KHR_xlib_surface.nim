# Generated at 2021-09-12T04:58:23Z
# VK_KHR_xlib_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  KhrXlibSurfaceSpecVersion* = 6
  KhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"

type # enums and bitmasks
  XlibSurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]

type
  XlibSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.xlibSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: XlibSurfaceCreateFlagsKHR
    dpy*: ptr Display
    window*: Window

proc createXlibSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr XlibSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateXlibSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceXlibPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dpy: ptr Display;
      visualID: VisualID;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceXlibPresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_xlib_surface*(instance: Instance) =
  createXlibSurfaceKHR.load(instance)
  getPhysicalDeviceXlibPresentationSupportKHR.load(instance)

proc loadVK_KHR_xlib_surface*(instance: Instance) =
  createXlibSurfaceKHR.load(instance)
  getPhysicalDeviceXlibPresentationSupportKHR.load(instance)

