
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  AndroidSurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: AndroidSurfaceCreateFlagsKHR
    window*: ptr ANativeWindow
  ANativeWindow* = distinct object
  AndroidSurfaceCreateFlagsKHR* = distinct Flags

const KhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"
const KhrAndroidSurfaceSpecVersion* = 6
var # commands
  createAndroidSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr AndroidSurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}

proc createAndroidSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr AndroidSurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl.} =
  createAndroidSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)


proc loadVK_KHR_android_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createAndroidSurfaceKHRCage << "vkCreateAndroidSurfaceKHR"