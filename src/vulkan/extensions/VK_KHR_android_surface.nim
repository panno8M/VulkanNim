# Generated at 2021-12-26T10:16:14Z
# VK_KHR_android_surface

import ../platform

import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

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
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorNativeWindowInUseKhr),
      lazyload("vkCreateAndroidSurfaceKHR", InstanceLevel).}

proc loadAllVK_KHR_android_surface*(instance: Instance) =
  instance.loadCommand createAndroidSurfaceKHR

proc loadVK_KHR_android_surface*(instance: Instance) =
  instance.loadCommand createAndroidSurfaceKHR

