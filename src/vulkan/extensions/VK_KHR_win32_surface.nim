# Generated at 2021-08-31T05:19:03Z
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
    sType*: StructureType
    pNext*: pointer
    flags*: Win32SurfaceCreateFlagsKHR
    hinstance*: HINSTANCE
    hwnd*: HWND

var # command cages
  createWin32SurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr Win32SurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getPhysicalDeviceWin32PresentationSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32;): Bool32 {.cdecl.}
proc createWin32SurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr Win32SurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createWin32SurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)
proc getPhysicalDeviceWin32PresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
    ): Bool32 {.cdecl.} =
  getPhysicalDeviceWin32PresentationSupportKHRCage(physicalDevice,queueFamilyIndex)

proc loadVK_KHR_win32_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createWin32SurfaceKHRCage << "vkCreateWin32SurfaceKHR"
  getPhysicalDeviceWin32PresentationSupportKHRCage << "vkGetPhysicalDeviceWin32PresentationSupportKHR"