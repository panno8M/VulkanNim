
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  XlibSurfaceCreateFlagsKHR* = distinct Flags
  XlibSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: XlibSurfaceCreateFlagsKHR
    dpy*: ptr Display
    window*: Window

const KhrXlibSurfaceSpecVersion* = 6
const KhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"
var # commands
  getPhysicalDeviceXlibPresentationSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; dpy: ptr Display; visualID: VisualID;): Bool32 {.cdecl.}
  createXlibSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr XlibSurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}

proc getPhysicalDeviceXlibPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dpy: ptr Display;
      visualID: VisualID;
    ): Bool32 {.cdecl.} =
  getPhysicalDeviceXlibPresentationSupportKHRCage(physicalDevice,queueFamilyIndex,dpy,visualID)

proc createXlibSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr XlibSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl.} =
  createXlibSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)


proc loadVK_KHR_xlib_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceXlibPresentationSupportKHRCage << "vkGetPhysicalDeviceXlibPresentationSupportKHR"
  createXlibSurfaceKHRCage << "vkCreateXlibSurfaceKHR"