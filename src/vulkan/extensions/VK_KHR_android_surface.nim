# Generated at 2021-08-30T22:51:48Z
# VK_KHR_android_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface

type # basetypes
  ANativeWindow* = distinct object

const
  KhrAndroidSurfaceSpecVersion* = 6
  KhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

type
  AndroidSurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]
  AndroidSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: AndroidSurfaceCreateFlagsKHR
    window*: ptr ANativeWindow

var # command cages
  createAndroidSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr AndroidSurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createAndroidSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr AndroidSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createAndroidSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_KHR_android_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createAndroidSurfaceKHRCage << "vkCreateAndroidSurfaceKHR"