# Generated at 2021-09-10T05:27:58Z
# VK_KHR_xcb_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  KhrXcbSurfaceSpecVersion* = 6
  KhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"

type # enums and bitmasks
  XcbSurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]

type
  XcbSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.xcbSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: XcbSurfaceCreateFlagsKHR
    connection*: ptr xcb_connection_t
    window*: xcb_window_t

proc createXcbSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr XcbSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateXcbSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceXcbPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      connection: ptr xcb_connection_t;
      visual_id: xcb_visualid_t;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceXcbPresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_xcb_surface*(instance: Instance) =
  createXcbSurfaceKHR.smartLoad(instance)
  getPhysicalDeviceXcbPresentationSupportKHR.smartLoad(instance)

proc loadVK_KHR_xcb_surface*(instance: Instance) =
  createXcbSurfaceKHR.smartLoad(instance)
  getPhysicalDeviceXcbPresentationSupportKHR.smartLoad(instance)

