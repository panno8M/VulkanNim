# Generated at 2021-08-28T12:28:01Z
# VK_EXT_headless_surface
# =================================

import ../platform
import ../features/vk10
import VK_KHR_surface


const
  ExtHeadlessSurfaceSpecVersion* = 1
  ExtHeadlessSurfaceExtensionName* = "VK_EXT_headless_surface"

type
  HeadlessSurfaceCreateFlagsEXT* = Flags[distinct UnusedEnum]
  HeadlessSurfaceCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: HeadlessSurfaceCreateFlagsEXT

var # commands
  createHeadlessSurfaceEXTCage: proc(instance: Instance; pCreateInfo: ptr HeadlessSurfaceCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createHeadlessSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr HeadlessSurfaceCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createHeadlessSurfaceEXTCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_EXT_headless_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createHeadlessSurfaceEXTCage << "vkCreateHeadlessSurfaceEXT"
