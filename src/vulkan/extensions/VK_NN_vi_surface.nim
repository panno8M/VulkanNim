# VK_NN_vi_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  NnViSurfaceSpecVersion* = 1
  NnViSurfaceExtensionName* = "VK_NN_vi_surface"

type
  ViSurfaceCreateInfoNN* = object
    sType* {.constant: (StructureType.viSurfaceCreateInfoNn).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ViSurfaceCreateFlagsNN
    window*: pointer

proc createViSurfaceNN*(
      instance: Instance;
      pCreateInfo: ptr ViSurfaceCreateInfoNN;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr],
      lazyload("vkCreateViSurfaceNN", InstanceLevel).}

proc loadAllVK_NN_vi_surface*(instance: Instance) = instance.loadCommands:
  createViSurfaceNN
proc loadVK_NN_vi_surface*(instance: Instance) = instance.loadCommands:
  createViSurfaceNN
