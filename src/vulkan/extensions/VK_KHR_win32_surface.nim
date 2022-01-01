# VK_KHR_win32_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  KhrWin32SurfaceSpecVersion* = 6
  KhrWin32SurfaceExtensionName* = "VK_KHR_win32_surface"

type
  Win32SurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.win32SurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: Win32SurfaceCreateFlagsKHR
    hinstance*: HINSTANCE
    hwnd*: HWND

proc createWin32SurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr Win32SurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateWin32SurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceWin32PresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceWin32PresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_win32_surface*(instance: Instance) = instance.loadCommands:
  createWin32SurfaceKHR
  getPhysicalDeviceWin32PresentationSupportKHR
proc loadVK_KHR_win32_surface*(instance: Instance) = instance.loadCommands:
  createWin32SurfaceKHR
  getPhysicalDeviceWin32PresentationSupportKHR
