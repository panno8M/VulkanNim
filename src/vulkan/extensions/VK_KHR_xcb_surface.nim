# Generated at 2021-08-27T06:01:02Z
# VK_KHR_xcb_surface
# =================================

import ../platform
import ../features/vk10
import VK_KHR_surface


const
  KhrXcbSurfaceSpecVersion* = 6
  KhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"

type
  XcbSurfaceCreateFlagsKHR* = distinct Flags
  XcbSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: XcbSurfaceCreateFlagsKHR
    connection*: ptr xcb_connection_t
    window*: xcb_window_t

var # commands
  createXcbSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr XcbSurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getPhysicalDeviceXcbPresentationSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; connection: ptr xcb_connection_t; visual_id: xcb_visualid_t;): Bool32 {.cdecl.}
proc createXcbSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr XcbSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createXcbSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)
proc getPhysicalDeviceXcbPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      connection: ptr xcb_connection_t;
      visual_id: xcb_visualid_t;
    ): Bool32 {.cdecl.} =
  getPhysicalDeviceXcbPresentationSupportKHRCage(physicalDevice,queueFamilyIndex,connection,visual_id)
proc loadVK_KHR_xcb_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createXcbSurfaceKHRCage << "vkCreateXcbSurfaceKHR"
  getPhysicalDeviceXcbPresentationSupportKHRCage << "vkGetPhysicalDeviceXcbPresentationSupportKHR"