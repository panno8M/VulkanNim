# Generated at 2021-12-25T07:50:19Z
# VK_EXT_directfb_surface

import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

prepareVulkanLibDef()

const
  ExtDirectfbSurfaceSpecVersion* = 1
  ExtDirectfbSurfaceExtensionName* = "VK_EXT_directfb_surface"

type
  DirectFBSurfaceCreateInfoEXT* = object
    sType* {.constant: (StructureType.directfbSurfaceCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DirectFBSurfaceCreateFlagsEXT
    dfb*: ptr IDirectFB
    surface*: ptr IDirectFBSurface

proc createDirectFBSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr DirectFBSurfaceCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkCreateDirectFBSurfaceEXT", InstanceLevel).}
proc getPhysicalDeviceDirectFBPresentationSupportEXT*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dfb: ptr IDirectFB;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceDirectFBPresentationSupportEXT", InstanceLevel).}

proc loadAllVK_EXT_directfb_surface*(instance: Instance) =
  instance.loadCommand createDirectFBSurfaceEXT
  instance.loadCommand getPhysicalDeviceDirectFBPresentationSupportEXT

proc loadVK_EXT_directfb_surface*(instance: Instance) =
  instance.loadCommand createDirectFBSurfaceEXT
  instance.loadCommand getPhysicalDeviceDirectFBPresentationSupportEXT

