
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  MacOSSurfaceCreateInfoMVK* = object
    sType*: StructureType
    pNext*: pointer
    flags*: MacOSSurfaceCreateFlagsMVK
    pView*: pointer
  MacOSSurfaceCreateFlagsMVK* = distinct Flags

const MmacosSurfaceExtensionName* = "VK_MVK_macos_surface"
const MmacosSurfaceSpecVersion* = 3
var # commands
  createMacOSSurfaceMVKCage: proc(instance: Instance; pCreateInfo: ptr MacOSSurfaceCreateInfoMVK; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}

proc createMacOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr MacOSSurfaceCreateInfoMVK;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl.} =
  createMacOSSurfaceMVKCage(instance,pCreateInfo,pAllocator,pSurface)


proc loadVK_MVK_macos_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createMacOSSurfaceMVKCage << "vkCreateMacOSSurfaceMVK"