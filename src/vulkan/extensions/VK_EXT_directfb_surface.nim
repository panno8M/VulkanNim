
import ../platform
import ../features/vk10
import VK_KHR_surface


const
  ExtDirectfbSurfaceSpecVersion* = 1
  ExtDirectfbSurfaceExtensionName* = "VK_EXT_directfb_surface"

type
  DirectFBSurfaceCreateFlagsEXT* = distinct Flags
  DirectFBSurfaceCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DirectFBSurfaceCreateFlagsEXT
    dfb*: ptr IDirectFB
    surface*: ptr IDirectFBSurface

var # commands
  createDirectFBSurfaceEXTCage: proc(instance: Instance; pCreateInfo: ptr DirectFBSurfaceCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getPhysicalDeviceDirectFBPresentationSupportEXTCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; dfb: ptr IDirectFB;): Bool32 {.cdecl.}
proc createDirectFBSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr DirectFBSurfaceCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createDirectFBSurfaceEXTCage(instance,pCreateInfo,pAllocator,pSurface)
proc getPhysicalDeviceDirectFBPresentationSupportEXT*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dfb: ptr IDirectFB;
    ): Bool32 {.cdecl.} =
  getPhysicalDeviceDirectFBPresentationSupportEXTCage(physicalDevice,queueFamilyIndex,dfb)
proc loadVK_EXT_directfb_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createDirectFBSurfaceEXTCage << "vkCreateDirectFBSurfaceEXT"
  getPhysicalDeviceDirectFBPresentationSupportEXTCage << "vkGetPhysicalDeviceDirectFBPresentationSupportEXT"