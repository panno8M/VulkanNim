# Generated at 2021-12-31T11:28:23Z
# VK_KHR_xcb_surface

import ../platform

import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface
prepareVulkanLibDef()

const
  KhrXcbSurfaceSpecVersion* = 6
  KhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"

type
  XcbSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.xcbSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: XcbSurfaceCreateFlagsKHR
    connection*: ptr XcbConnection
    window*: XcbWindow

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

proc loadAllVK_KHR_xcb_surface*(instance: Instance) = instance.loadCommands:
  createXcbSurfaceKHR
  getPhysicalDeviceXcbPresentationSupportKHR
proc loadVK_KHR_xcb_surface*(instance: Instance) = instance.loadCommands:
  createXcbSurfaceKHR
  getPhysicalDeviceXcbPresentationSupportKHR
