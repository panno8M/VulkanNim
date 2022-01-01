# VK_MVK_macos_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  MmacosSurfaceSpecVersion* = 3
  MmacosSurfaceExtensionName* = "VK_MVK_macos_surface"

type
  MacOSSurfaceCreateInfoMVK* = object
    sType* {.constant: (StructureType.macosSurfaceCreateInfoM).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: MacOSSurfaceCreateFlagsMVK
    pView*: pointer

proc createMacOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr MacOSSurfaceCreateInfoMVK;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr],
      lazyload("vkCreateMacOSSurfaceMVK", InstanceLevel).}

proc loadAllVK_MVK_macos_surface*(instance: Instance) = instance.loadCommands:
  createMacOSSurfaceMVK
proc loadVK_MVK_macos_surface*(instance: Instance) = instance.loadCommands:
  createMacOSSurfaceMVK
