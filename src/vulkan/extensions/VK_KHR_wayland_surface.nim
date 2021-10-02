# Generated at 2021-10-02T09:29:45Z
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
    sType* {.constant: (StructureType.waylandSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: WaylandSurfaceCreateFlagsKHR
    display*: ptr wl_display
    surface*: ptr wl_surface

proc createWaylandSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr WaylandSurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkCreateWaylandSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceWaylandPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      display: ptr wl_display;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceWaylandPresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_wayland_surface*(instance: Instance) =
  createWaylandSurfaceKHR.load(instance)
  getPhysicalDeviceWaylandPresentationSupportKHR.load(instance)

proc loadVK_KHR_wayland_surface*(instance: Instance) =
  createWaylandSurfaceKHR.load(instance)
  getPhysicalDeviceWaylandPresentationSupportKHR.load(instance)

