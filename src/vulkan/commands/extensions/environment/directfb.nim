# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_EXT_directfb_surface

import ../../tools
const
  # VK_EXT_directfb_surface
  ExtDirectfbSurfaceSpecVersion* = 1
  ExtDirectfbSurfaceExtensionName* = "VK_EXT_directfb_surface"


# VK_EXT_directfb_surface
# =======================
proc createDirectFBSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr DirectFBSurfaceCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.lazyload("vkCreateDirectFBSurfaceEXT", InstanceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
proc getPhysicalDeviceDirectFBPresentationSupportEXT*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dfb: ptr IDirectFB;
    ): Bool32 {.lazyload("vkGetPhysicalDeviceDirectFBPresentationSupportEXT", InstanceLevel).}


proc loadAllVK_EXT_directfb_surface*(instance: Instance) = instance.loadCommands:
  createDirectFBSurfaceEXT
  getPhysicalDeviceDirectFBPresentationSupportEXT
proc loadVK_EXT_directfb_surface*(instance: Instance) = instance.loadCommands:
  createDirectFBSurfaceEXT
  getPhysicalDeviceDirectFBPresentationSupportEXT