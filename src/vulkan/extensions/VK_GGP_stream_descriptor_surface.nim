# VK_GGP_stream_descriptor_surface

import ../features/vk10
import VK_KHR_surface
import ../platform
prepareVulkanLibDef()

const
  GgpStreamDescriptorSurfaceSpecVersion* = 1
  GgpStreamDescriptorSurfaceExtensionName* = "VK_GGP_stream_descriptor_surface"

type
  StreamDescriptorSurfaceCreateInfoGGP* = object
    sType* {.constant: (StructureType.streamDescriptorSurfaceCreateInfoGgp).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: StreamDescriptorSurfaceCreateFlagsGGP
    streamDescriptor*: GgpStreamDescriptor

proc createStreamDescriptorSurfaceGGP*(
      instance: Instance;
      pCreateInfo: ptr StreamDescriptorSurfaceCreateInfoGGP;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr],
      lazyload("vkCreateStreamDescriptorSurfaceGGP", InstanceLevel).}

proc loadAllVK_GGP_stream_descriptor_surface*(instance: Instance) = instance.loadCommands:
  createStreamDescriptorSurfaceGGP
proc loadVK_GGP_stream_descriptor_surface*(instance: Instance) = instance.loadCommands:
  createStreamDescriptorSurfaceGGP
