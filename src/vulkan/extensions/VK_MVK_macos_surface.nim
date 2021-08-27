
import ../platform
import ../features/vk10
import VK_KHR_surface


const
  MmacosSurfaceSpecVersion* = 3
  MmacosSurfaceExtensionName* = "VK_MVK_macos_surface"

type
  MacOSSurfaceCreateFlagsMVK* = distinct Flags
  MacOSSurfaceCreateInfoMVK* = object
    sType*: StructureType
    pNext*: pointer
    flags*: MacOSSurfaceCreateFlagsMVK
    pView*: pointer

var # commands
  createMacOSSurfaceMVKCage: proc(instance: Instance; pCreateInfo: ptr MacOSSurfaceCreateInfoMVK; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createMacOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr MacOSSurfaceCreateInfoMVK;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createMacOSSurfaceMVKCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_MVK_macos_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createMacOSSurfaceMVKCage << "vkCreateMacOSSurfaceMVK"