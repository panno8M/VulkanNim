# Generated at 2021-09-16T07:11:43Z
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
    sType* {.constant: (StructureType.viSurfaceCreateInfoNn).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ViSurfaceCreateFlagsNN
    window*: pointer

proc createViSurfaceNN*(
      instance: Instance;
      pCreateInfo: ptr ViSurfaceCreateInfoNN;
      pAllocator = default(ptr AllocationCallbacks); # optional
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateViSurfaceNN", InstanceLevel).}

proc loadAllVK_NN_vi_surface*(instance: Instance) =
  createViSurfaceNN.load(instance)

proc loadVK_NN_vi_surface*(instance: Instance) =
  createViSurfaceNN.load(instance)

