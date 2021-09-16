# Generated at 2021-09-12T04:58:23Z
# VK_GGP_stream_descriptor_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  GgpStreamDescriptorSurfaceSpecVersion* = 1
  GgpStreamDescriptorSurfaceExtensionName* = "VK_GGP_stream_descriptor_surface"

type # enums and bitmasks
  StreamDescriptorSurfaceCreateFlagsGGP* = Flags[distinct UnusedEnum]

type
  StreamDescriptorSurfaceCreateInfoGGP* = object
    sType* {.constant: (StructureType.streamDescriptorSurfaceCreateInfoGgp).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: StreamDescriptorSurfaceCreateFlagsGGP
    streamDescriptor*: GgpStreamDescriptor

proc createStreamDescriptorSurfaceGGP*(
      instance: Instance;
      pCreateInfo: ptr StreamDescriptorSurfaceCreateInfoGGP;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateStreamDescriptorSurfaceGGP", InstanceLevel).}

proc loadAllVK_GGP_stream_descriptor_surface*(instance: Instance) =
  createStreamDescriptorSurfaceGGP.load(instance)

proc loadVK_GGP_stream_descriptor_surface*(instance: Instance) =
  createStreamDescriptorSurfaceGGP.load(instance)

