# Generated at 2021-10-24T09:33:17Z
# VK_NN_vi_surface

import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

prepareVulkanLibDef()

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
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorNativeWindowInUseKhr),
      lazyload("vkCreateViSurfaceNN", InstanceLevel).}

proc loadAllVK_NN_vi_surface*(instance: Instance) =
  instance.loadCommand createViSurfaceNN

proc loadVK_NN_vi_surface*(instance: Instance) =
  instance.loadCommand createViSurfaceNN

