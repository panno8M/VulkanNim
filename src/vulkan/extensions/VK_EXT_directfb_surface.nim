# Generated at 2021-09-09T01:49:36Z
# VK_EXT_directfb_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  ExtDirectfbSurfaceSpecVersion* = 1
  ExtDirectfbSurfaceExtensionName* = "VK_EXT_directfb_surface"

type # enums and bitmasks
  DirectFBSurfaceCreateFlagsEXT* = Flags[distinct UnusedEnum]

type
  DirectFBSurfaceCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DirectFBSurfaceCreateFlagsEXT
    dfb*: ptr IDirectFB
    surface*: ptr IDirectFBSurface

proc createDirectFBSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr DirectFBSurfaceCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateDirectFBSurfaceEXT", InstanceLevel).}
proc getPhysicalDeviceDirectFBPresentationSupportEXT*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dfb: ptr IDirectFB;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceDirectFBPresentationSupportEXT", InstanceLevel).}

proc loadAllVK_EXT_directfb_surface*(instance: Instance) =
  createDirectFBSurfaceEXT.smartLoad(instance)
  getPhysicalDeviceDirectFBPresentationSupportEXT.smartLoad(instance)

proc loadVK_EXT_directfb_surface*(instance: Instance) =
  createDirectFBSurfaceEXT.smartLoad(instance)
  getPhysicalDeviceDirectFBPresentationSupportEXT.smartLoad(instance)

