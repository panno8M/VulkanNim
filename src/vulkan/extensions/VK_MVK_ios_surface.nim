# Generated at 2021-08-28T12:28:00Z
# VK_MVK_ios_surface
# =================================

import ../platform
import ../features/vk10
import VK_KHR_surface


const
  MiosSurfaceSpecVersion* = 3
  MiosSurfaceExtensionName* = "VK_MVK_ios_surface"

type
  IOSSurfaceCreateFlagsMVK* = Flags[distinct UnusedEnum]
  IOSSurfaceCreateInfoMVK* = object
    sType*: StructureType
    pNext*: pointer
    flags*: IOSSurfaceCreateFlagsMVK
    pView*: pointer

var # commands
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
