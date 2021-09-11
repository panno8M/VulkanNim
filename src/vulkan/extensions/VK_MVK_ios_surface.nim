# Generated at 2021-09-10T05:27:58Z
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
    sType* {.constant: (StructureType.iosSurfaceCreateInfoM).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: IOSSurfaceCreateFlagsMVK
    pView*: pointer

proc createIOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr IOSSurfaceCreateInfoMVK;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateIOSSurfaceMVK", InstanceLevel).}

proc loadAllVK_MVK_ios_surface*(instance: Instance) =
  createIOSSurfaceMVK.smartLoad(instance)

proc loadVK_MVK_ios_surface*(instance: Instance) =
  createIOSSurfaceMVK.smartLoad(instance)

