# VK_KHR_wayland_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  KhrWaylandSurfaceSpecVersion* = 6
  KhrWaylandSurfaceExtensionName* = "VK_KHR_wayland_surface"

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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateWaylandSurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceWaylandPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      display: ptr wl_display;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceWaylandPresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_wayland_surface*(instance: Instance) = instance.loadCommands:
  createWaylandSurfaceKHR
  getPhysicalDeviceWaylandPresentationSupportKHR
proc loadVK_KHR_wayland_surface*(instance: Instance) = instance.loadCommands:
  createWaylandSurfaceKHR
  getPhysicalDeviceWaylandPresentationSupportKHR
