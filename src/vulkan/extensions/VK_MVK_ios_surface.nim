# VK_MVK_ios_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  MiosSurfaceSpecVersion* = 3
  MiosSurfaceExtensionName* = "VK_MVK_ios_surface"

type
  IOSSurfaceCreateInfoMVK* = object
    sType* {.constant: (StructureType.iosSurfaceCreateInfoM).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: IOSSurfaceCreateFlagsMVK
    pView*: pointer

proc createIOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr IOSSurfaceCreateInfoMVK;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr],
      lazyload("vkCreateIOSSurfaceMVK", InstanceLevel).}

proc loadAllVK_MVK_ios_surface*(instance: Instance) = instance.loadCommands:
  createIOSSurfaceMVK
proc loadVK_MVK_ios_surface*(instance: Instance) = instance.loadCommands:
  createIOSSurfaceMVK
