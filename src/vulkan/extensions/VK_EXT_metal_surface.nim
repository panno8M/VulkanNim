# Generated at 2021-09-22T15:02:54Z
# VK_EXT_metal_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

type # basetypes
  CAMetalLayer* = distinct object

const
  ExtMetalSurfaceSpecVersion* = 1
  ExtMetalSurfaceExtensionName* = "VK_EXT_metal_surface"

type # enums and bitmasks
  MetalSurfaceCreateFlagsEXT* = Flags[distinct UnusedEnum]

type
  MetalSurfaceCreateInfoEXT* = object
    sType* {.constant: (StructureType.metalSurfaceCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: MetalSurfaceCreateFlagsEXT
    pLayer*: ptr CAMetalLayer

proc createMetalSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr MetalSurfaceCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateMetalSurfaceEXT", InstanceLevel).}

proc loadAllVK_EXT_metal_surface*(instance: Instance) =
  createMetalSurfaceEXT.load(instance)

proc loadVK_EXT_metal_surface*(instance: Instance) =
  createMetalSurfaceEXT.load(instance)

