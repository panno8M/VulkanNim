# VK_GGP_stream_descriptor_surface
# VK_GGP_frame_token

import ../../features/vk10
import ../../platform
prepareVulkanLibDef()

const
  GgpStreamDescriptorSurfaceSpecVersion* = 1
  GgpStreamDescriptorSurfaceExtensionName* = "VK_GGP_stream_descriptor_surface"

  GgpFrameTokenSpecVersion* = 1
  GgpFrameTokenExtensionName* = "VK_GGP_frame_token"

type
  StreamDescriptorSurfaceCreateInfoGGP* = object
    sType* {.constant: (StructureType.streamDescriptorSurfaceCreateInfoGgp).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: StreamDescriptorSurfaceCreateFlagsGGP
    streamDescriptor*: GgpStreamDescriptor

  PresentFrameTokenGGP* = object
    sType* {.constant: (StructureType.presentFrameTokenGgp).}: StructureType
    pNext* {.optional.}: pointer
    frameToken*: GgpFrameToken

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
