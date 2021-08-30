# Generated at 2021-08-30T22:51:48Z
# VK_EXT_metal_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface

type # basetypes
  CAMetalLayer* = distinct object

const
  ExtMetalSurfaceSpecVersion* = 1
  ExtMetalSurfaceExtensionName* = "VK_EXT_metal_surface"

type
  MetalSurfaceCreateFlagsEXT* = Flags[distinct UnusedEnum]
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