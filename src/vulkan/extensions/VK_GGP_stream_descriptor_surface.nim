# Generated at 2021-12-30T17:10:58Z
# VK_GGP_stream_descriptor_surface

import ../platform

import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface
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
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorNativeWindowInUseKhr),
      lazyload("vkCreateStreamDescriptorSurfaceGGP", InstanceLevel).}

proc loadAllVK_GGP_stream_descriptor_surface*(instance: Instance) = instance.loadCommands:
  createStreamDescriptorSurfaceGGP
proc loadVK_GGP_stream_descriptor_surface*(instance: Instance) = instance.loadCommands:
  createStreamDescriptorSurfaceGGP
