# VK_EXT_directfb_surface

import ../../features/vk10
import ../../platform
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateDirectFBSurfaceEXT", InstanceLevel).}
proc getPhysicalDeviceDirectFBPresentationSupportEXT*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      dfb: ptr IDirectFB;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceDirectFBPresentationSupportEXT", InstanceLevel).}

proc loadAllVK_EXT_directfb_surface*(instance: Instance) = instance.loadCommands:
  createDirectFBSurfaceEXT
  getPhysicalDeviceDirectFBPresentationSupportEXT
proc loadVK_EXT_directfb_surface*(instance: Instance) = instance.loadCommands:
  createDirectFBSurfaceEXT
  getPhysicalDeviceDirectFBPresentationSupportEXT
