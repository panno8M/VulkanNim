
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  Win32SurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: Win32SurfaceCreateFlagsKHR
    hinstance*: HINSTANCE
    hwnd*: HWND
  Win32SurfaceCreateFlagsKHR* = distinct Flags

const KhrWin32SurfaceSpecVersion* = 6
const KhrWin32SurfaceExtensionName* = "VK_KHR_win32_surface"
var # commands
  createWin32SurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr Win32SurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getPhysicalDeviceWin32PresentationSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32;): Bool32 {.cdecl.}

proc createWin32SurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr Win32SurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl.} =
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