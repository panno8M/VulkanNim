# Generated at 2021-12-31T11:28:23Z
# VK_QNX_screen_surface

import ../platform

import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface
prepareVulkanLibDef()

const
  QnxScreenSurfaceSpecVersion* = 1
  QnxScreenSurfaceExtensionName* = "VK_QNX_screen_surface"

type
  ScreenSurfaceCreateInfoQNX* = object
    sType* {.constant: (StructureType.screenSurfaceCreateInfoQnx).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ScreenSurfaceCreateFlagsQNX
    context*: ptr _screen_context
    window*: ptr _screen_window

proc createScreenSurfaceQNX*(
      instance: Instance;
      pCreateInfo: ptr ScreenSurfaceCreateInfoQNX;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateScreenSurfaceQNX", InstanceLevel).}
proc getPhysicalDeviceScreenPresentationSupportQNX*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      window: ptr _screen_window;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceScreenPresentationSupportQNX", InstanceLevel).}

proc loadAllVK_QNX_screen_surface*(instance: Instance) = instance.loadCommands:
  createScreenSurfaceQNX
  getPhysicalDeviceScreenPresentationSupportQNX
proc loadVK_QNX_screen_surface*(instance: Instance) = instance.loadCommands:
  createScreenSurfaceQNX
  getPhysicalDeviceScreenPresentationSupportQNX
