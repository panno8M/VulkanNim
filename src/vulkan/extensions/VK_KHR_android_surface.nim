# VK_KHR_android_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  KhrAndroidSurfaceSpecVersion* = 6
  KhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

type
  AndroidSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.androidSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: AndroidSurfaceCreateFlagsKHR
    window*: ptr ANativeWindow

proc createAndroidSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr AndroidSurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr],
      lazyload("vkCreateAndroidSurfaceKHR", InstanceLevel).}

proc loadAllVK_KHR_android_surface*(instance: Instance) = instance.loadCommands:
  createAndroidSurfaceKHR
proc loadVK_KHR_android_surface*(instance: Instance) = instance.loadCommands:
  createAndroidSurfaceKHR
