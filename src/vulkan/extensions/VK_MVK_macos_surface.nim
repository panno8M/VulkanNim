# Generated at 2021-09-16T07:49:56Z
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
    sType* {.constant: (StructureType.macosSurfaceCreateInfoM).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: MacOSSurfaceCreateFlagsMVK
    pView*: pointer

proc createMacOSSurfaceMVK*(
      instance: Instance;
      pCreateInfo: ptr MacOSSurfaceCreateInfoMVK;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateMacOSSurfaceMVK", InstanceLevel).}

proc loadAllVK_MVK_macos_surface*(instance: Instance) =
  createMacOSSurfaceMVK.load(instance)

proc loadVK_MVK_macos_surface*(instance: Instance) =
  createMacOSSurfaceMVK.load(instance)

