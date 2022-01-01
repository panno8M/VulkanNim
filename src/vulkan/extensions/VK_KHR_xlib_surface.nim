# VK_KHR_xlib_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  KhrXlibSurfaceSpecVersion* = 6
  KhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"

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
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateXlibSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceXlibPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dpy: ptr Display;
      visualID: VisualID;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceXlibPresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_xlib_surface*(instance: Instance) = instance.loadCommands:
  createXlibSurfaceKHR
  getPhysicalDeviceXlibPresentationSupportKHR
proc loadVK_KHR_xlib_surface*(instance: Instance) = instance.loadCommands:
  createXlibSurfaceKHR
  getPhysicalDeviceXlibPresentationSupportKHR
