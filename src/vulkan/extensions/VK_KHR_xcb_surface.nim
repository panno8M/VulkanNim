
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  XcbSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: XcbSurfaceCreateFlagsKHR
    connection*: ptr xcb_connection_t
    window*: xcb_window_t
  XcbSurfaceCreateFlagsKHR* = distinct Flags

const KhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"
const KhrXcbSurfaceSpecVersion* = 6
var # commands
  createXcbSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr XcbSurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getPhysicalDeviceXcbPresentationSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; connection: ptr xcb_connection_t; visual_id: xcb_visualid_t;): Bool32 {.cdecl.}

proc createXcbSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr XcbSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createXcbSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)

proc getPhysicalDeviceXcbPresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      connection: ptr xcb_connection_t;
      visual_id: xcb_visualid_t;
    ): Bool32 {.cdecl.} =
  getPhysicalDeviceXcbPresentationSupportKHRCage(physicalDevice,queueFamilyIndex,connection,visual_id)


proc loadVK_KHR_xcb_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createXcbSurfaceKHRCage << "vkCreateXcbSurfaceKHR"
  getPhysicalDeviceXcbPresentationSupportKHRCage << "vkGetPhysicalDeviceXcbPresentationSupportKHR"