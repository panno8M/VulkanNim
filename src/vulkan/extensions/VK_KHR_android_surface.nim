# Generated at 2021-09-16T07:11:43Z
# VK_KHR_android_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

type # basetypes
  ANativeWindow* = distinct object

const
  KhrAndroidSurfaceSpecVersion* = 6
  KhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

type # enums and bitmasks
  AndroidSurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]

type
  AndroidSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.androidSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: AndroidSurfaceCreateFlagsKHR
    window*: ptr ANativeWindow

proc createAndroidSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr AndroidSurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks); # optional
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateAndroidSurfaceKHR", InstanceLevel).}

proc loadAllVK_KHR_android_surface*(instance: Instance) =
  createAndroidSurfaceKHR.load(instance)

proc loadVK_KHR_android_surface*(instance: Instance) =
  createAndroidSurfaceKHR.load(instance)

