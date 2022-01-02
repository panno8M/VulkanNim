# VK_EXT_metal_surface

import ../../features/vk10
import ../../platform
prepareVulkanLibDef()

const
  ExtMetalSurfaceSpecVersion* = 1
  ExtMetalSurfaceExtensionName* = "VK_EXT_metal_surface"

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
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr],
      lazyload("vkCreateMetalSurfaceEXT", InstanceLevel).}

proc loadAllVK_EXT_metal_surface*(instance: Instance) = instance.loadCommands:
  createMetalSurfaceEXT
proc loadVK_EXT_metal_surface*(instance: Instance) = instance.loadCommands:
  createMetalSurfaceEXT
