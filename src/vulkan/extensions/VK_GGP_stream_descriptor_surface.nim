# Generated at 2021-09-16T07:11:43Z
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
      pAllocator = default(ptr AllocationCallbacks); # optional
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateStreamDescriptorSurfaceGGP", InstanceLevel).}

proc loadAllVK_GGP_stream_descriptor_surface*(instance: Instance) =
  createStreamDescriptorSurfaceGGP.load(instance)

proc loadVK_GGP_stream_descriptor_surface*(instance: Instance) =
  createStreamDescriptorSurfaceGGP.load(instance)

