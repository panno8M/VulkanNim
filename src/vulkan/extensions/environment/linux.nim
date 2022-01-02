# VK_KHR_xlib_surface
# VK_KHR_xcb_surface
# VK_KHR_wayland_surface
# VK_EXT_acquire_xlib_display

import ../../features/vk10
import ../../platform
prepareVulkanLibDef()

const
  KhrXlibSurfaceSpecVersion* = 6
  KhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"

  KhrXcbSurfaceSpecVersion* = 6
  KhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"

  KhrWaylandSurfaceSpecVersion* = 6
  KhrWaylandSurfaceExtensionName* = "VK_KHR_wayland_surface"

  ExtAcquireXlibDisplaySpecVersion* = 1
  ExtAcquireXlibDisplayExtensionName* = "VK_EXT_acquire_xlib_display"

type
  XlibSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.xlibSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: XlibSurfaceCreateFlagsKHR
    dpy*: ptr Display
    window*: Window

  XcbSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.xcbSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: XcbSurfaceCreateFlagsKHR
    connection*: ptr XcbConnection
    window*: XcbWindow

  WaylandSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.waylandSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: WaylandSurfaceCreateFlagsKHR
    display*: ptr wl_display
    surface*: ptr wl_surface

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


proc createXcbSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr XcbSurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateXcbSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceXcbPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      connection: ptr XcbConnection;
      visual_id: XcbVisualid;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceXcbPresentationSupportKHR", InstanceLevel).}


proc createWaylandSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr WaylandSurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateWaylandSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceWaylandPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      display: ptr wl_display;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceWaylandPresentationSupportKHR", InstanceLevel).}


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

proc loadAllVK_KHR_xlib_surface*(instance: Instance) = instance.loadCommands:
  createXlibSurfaceKHR
  getPhysicalDeviceXlibPresentationSupportKHR
proc loadAllVK_KHR_xcb_surface*(instance: Instance) = instance.loadCommands:
  createXcbSurfaceKHR
  getPhysicalDeviceXcbPresentationSupportKHR
proc loadAllVK_KHR_wayland_surface*(instance: Instance) = instance.loadCommands:
  createWaylandSurfaceKHR
  getPhysicalDeviceWaylandPresentationSupportKHR
proc loadAllVK_EXT_acquire_xlib_display*(instance: Instance) = instance.loadCommands:
  acquireXlibDisplayEXT
  getRandROutputDisplayEXT
proc loadVK_KHR_xlib_surface*(instance: Instance) = instance.loadCommands:
  createXlibSurfaceKHR
  getPhysicalDeviceXlibPresentationSupportKHR
proc loadVK_KHR_xcb_surface*(instance: Instance) = instance.loadCommands:
  createXcbSurfaceKHR
  getPhysicalDeviceXcbPresentationSupportKHR
proc loadVK_KHR_wayland_surface*(instance: Instance) = instance.loadCommands:
  createWaylandSurfaceKHR
  getPhysicalDeviceWaylandPresentationSupportKHR
proc loadVK_EXT_acquire_xlib_display*(instance: Instance) = instance.loadCommands:
  acquireXlibDisplayEXT
  getRandROutputDisplayEXT
