# Generated at 2021-12-30T17:10:58Z
# VK_EXT_headless_surface

import ../platform

import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface
prepareVulkanLibDef()

const
  ExtHeadlessSurfaceSpecVersion* = 1
  ExtHeadlessSurfaceExtensionName* = "VK_EXT_headless_surface"

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
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkCreateHeadlessSurfaceEXT", InstanceLevel).}

proc loadAllVK_EXT_headless_surface*(instance: Instance) = instance.loadCommands:
  createHeadlessSurfaceEXT
proc loadVK_EXT_headless_surface*(instance: Instance) = instance.loadCommands:
  createHeadlessSurfaceEXT
