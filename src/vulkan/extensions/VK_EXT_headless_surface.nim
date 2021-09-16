# Generated at 2021-09-16T07:49:56Z
# VK_EXT_headless_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  ExtHeadlessSurfaceSpecVersion* = 1
  ExtHeadlessSurfaceExtensionName* = "VK_EXT_headless_surface"

type # enums and bitmasks
  HeadlessSurfaceCreateFlagsEXT* = Flags[distinct UnusedEnum]

type
  HeadlessSurfaceCreateInfoEXT* = object
    sType* {.constant: (StructureType.headlessSurfaceCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: HeadlessSurfaceCreateFlagsEXT

proc createHeadlessSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr HeadlessSurfaceCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateHeadlessSurfaceEXT", InstanceLevel).}

proc loadAllVK_EXT_headless_surface*(instance: Instance) =
  createHeadlessSurfaceEXT.load(instance)

proc loadVK_EXT_headless_surface*(instance: Instance) =
  createHeadlessSurfaceEXT.load(instance)

