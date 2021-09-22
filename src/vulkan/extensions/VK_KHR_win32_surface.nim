# Generated at 2021-09-22T15:02:54Z
# VK_KHR_win32_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  KhrWin32SurfaceSpecVersion* = 6
  KhrWin32SurfaceExtensionName* = "VK_KHR_win32_surface"

type # enums and bitmasks
  Win32SurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]

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
    ): Result {.cdecl, lazyload("vkCreateWin32SurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceWin32PresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceWin32PresentationSupportKHR", InstanceLevel).}

proc loadAllVK_KHR_win32_surface*(instance: Instance) =
  createWin32SurfaceKHR.load(instance)
  getPhysicalDeviceWin32PresentationSupportKHR.load(instance)

proc loadVK_KHR_win32_surface*(instance: Instance) =
  createWin32SurfaceKHR.load(instance)
  getPhysicalDeviceWin32PresentationSupportKHR.load(instance)

