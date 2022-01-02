# VK_EXT_headless_surface

import ../features/vk10
import ../platform
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateHeadlessSurfaceEXT", InstanceLevel).}

proc loadAllVK_EXT_headless_surface*(instance: Instance) = instance.loadCommands:
  createHeadlessSurfaceEXT
proc loadVK_EXT_headless_surface*(instance: Instance) = instance.loadCommands:
  createHeadlessSurfaceEXT
