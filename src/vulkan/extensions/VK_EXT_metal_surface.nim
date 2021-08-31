# Generated at 2021-08-31T01:03:35Z
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
    sType*: StructureType
    pNext*: pointer
    flags*: MetalSurfaceCreateFlagsEXT
    pLayer*: ptr CAMetalLayer

var # command cages
  createMetalSurfaceEXTCage: proc(instance: Instance; pCreateInfo: ptr MetalSurfaceCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createMetalSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr MetalSurfaceCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createMetalSurfaceEXTCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_EXT_metal_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createMetalSurfaceEXTCage << "vkCreateMetalSurfaceEXT"