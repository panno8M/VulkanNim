# Generated at 2021-09-09T01:49:36Z
# VK_KHR_wayland_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  KhrWaylandSurfaceSpecVersion* = 6
  KhrWaylandSurfaceExtensionName* = "VK_KHR_wayland_surface"

type # enums and bitmasks
  WaylandSurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]

type
  WaylandSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: WaylandSurfaceCreateFlagsKHR
    display*: ptr wl_display
    surface*: ptr wl_surface

proc createWaylandSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr WaylandSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateWaylandSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceWaylandPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      display: ptr wl_display;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceWaylandPresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_wayland_surface*(instance: Instance) =
  createWaylandSurfaceKHR.smartLoad(instance)
  getPhysicalDeviceWaylandPresentationSupportKHR.smartLoad(instance)

proc loadVK_KHR_wayland_surface*(instance: Instance) =
  createWaylandSurfaceKHR.smartLoad(instance)
  getPhysicalDeviceWaylandPresentationSupportKHR.smartLoad(instance)

