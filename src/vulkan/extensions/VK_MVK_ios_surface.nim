# Generated at 2021-08-31T05:19:03Z
# VK_MVK_ios_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  MiosSurfaceSpecVersion* = 3
  MiosSurfaceExtensionName* = "VK_MVK_ios_surface"

type # enums and bitmasks
  IOSSurfaceCreateFlagsMVK* = Flags[distinct UnusedEnum]

type
  IOSSurfaceCreateInfoMVK* = object
    sType*: StructureType
    pNext*: pointer
    flags*: IOSSurfaceCreateFlagsMVK
    pView*: pointer

var # command cages
  createIOSSurfaceMVKCage: proc(instance: Instance; pCreateInfo: ptr IOSSurfaceCreateInfoMVK; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createIOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr IOSSurfaceCreateInfoMVK;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createIOSSurfaceMVKCage(instance,pCreateInfo,pAllocator,pSurface)

proc loadVK_MVK_ios_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createIOSSurfaceMVKCage << "vkCreateIOSSurfaceMVK"