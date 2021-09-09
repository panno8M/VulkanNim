# Generated at 2021-09-09T01:49:36Z
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

proc createMacOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr MacOSSurfaceCreateInfoMVK;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateMacOSSurfaceMVK", InstanceLevel).}

proc loadAllVK_MVK_macos_surface*(instance: Instance) =
  createMacOSSurfaceMVK.smartLoad(instance)

proc loadVK_MVK_macos_surface*(instance: Instance) =
  createMacOSSurfaceMVK.smartLoad(instance)

