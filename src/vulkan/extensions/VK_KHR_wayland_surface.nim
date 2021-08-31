# Generated at 2021-08-31T05:19:03Z
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

var # command cages
  createWaylandSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr WaylandSurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getPhysicalDeviceWaylandPresentationSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; display: ptr wl_display;): Bool32 {.cdecl.}
proc createWaylandSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr WaylandSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createWaylandSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)
proc getPhysicalDeviceWaylandPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      display: ptr wl_display;
    ): Bool32 {.cdecl.} =
  getPhysicalDeviceWaylandPresentationSupportKHRCage(physicalDevice,queueFamilyIndex,display)

proc loadVK_KHR_wayland_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createWaylandSurfaceKHRCage << "vkCreateWaylandSurfaceKHR"
  getPhysicalDeviceWaylandPresentationSupportKHRCage << "vkGetPhysicalDeviceWaylandPresentationSupportKHR"