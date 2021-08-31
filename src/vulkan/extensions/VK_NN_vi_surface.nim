# Generated at 2021-08-31T01:03:35Z
# VK_NN_vi_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  NnViSurfaceSpecVersion* = 1
  NnViSurfaceExtensionName* = "VK_NN_vi_surface"

type # enums and bitmasks
  ViSurfaceCreateFlagsNN* = Flags[distinct UnusedEnum]

type
  ViSurfaceCreateInfoNN* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ViSurfaceCreateFlagsNN
    window*: pointer

var # command cages
  createViSurfaceNNCage: proc(instance: Instance; pCreateInfo: ptr ViSurfaceCreateInfoNN; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createViSurfaceNN*(
      instance: Instance;
      pCreateInfo: ptr ViSurfaceCreateInfoNN;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createViSurfaceNNCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_NN_vi_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createViSurfaceNNCage << "vkCreateViSurfaceNN"