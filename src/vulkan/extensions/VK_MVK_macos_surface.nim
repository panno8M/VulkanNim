# Generated at 2021-12-26T10:42:47Z
# VK_MVK_macos_surface

import ../platform

import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface
prepareVulkanLibDef()

const
  MmacosSurfaceSpecVersion* = 3
  MmacosSurfaceExtensionName* = "VK_MVK_macos_surface"

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
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorNativeWindowInUseKhr),
      lazyload("vkCreateMacOSSurfaceMVK", InstanceLevel).}

proc loadAllVK_MVK_macos_surface*(instance: Instance) =
  instance.loadCommand createMacOSSurfaceMVK

proc loadVK_MVK_macos_surface*(instance: Instance) =
  instance.loadCommand createMacOSSurfaceMVK

