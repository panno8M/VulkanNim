# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_MVK_macos_surface

import ../../tools
const
  # VK_MVK_macos_surface
  MmacosSurfaceSpecVersion* = 3
  MmacosSurfaceExtensionName* = "VK_MVK_macos_surface"


# VK_MVK_macos_surface
# ====================
proc createMacOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr MacOSSurfaceCreateInfoMVK;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.lazyload("vkCreateMacOSSurfaceMVK", InstanceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr].}


proc loadAllVK_MVK_macos_surface*(instance: Instance) = instance.loadCommands:
  createMacOSSurfaceMVK
proc loadVK_MVK_macos_surface*(instance: Instance) = instance.loadCommands:
  createMacOSSurfaceMVK