# Generated at 2021-08-31T01:03:35Z
# VK_MVK_macos_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  MmacosSurfaceSpecVersion* = 3
  MmacosSurfaceExtensionName* = "VK_MVK_macos_surface"

type # enums and bitmasks
  MacOSSurfaceCreateFlagsMVK* = Flags[distinct UnusedEnum]

type
  MacOSSurfaceCreateInfoMVK* = object
    sType*: StructureType
    pNext*: pointer
    flags*: MacOSSurfaceCreateFlagsMVK
    pView*: pointer

var # command cages
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