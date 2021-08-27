
import ../platform
import ../features/vk10
import VK_KHR_surface


const
  KhrAndroidSurfaceSpecVersion* = 6
  KhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

type
  ANativeWindow* = distinct object
  AndroidSurfaceCreateFlagsKHR* = distinct Flags
  AndroidSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: AndroidSurfaceCreateFlagsKHR
    window*: ptr ANativeWindow

var # commands
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