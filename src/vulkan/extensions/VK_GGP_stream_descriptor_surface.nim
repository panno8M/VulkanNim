
import ../platform
import ../features/vk10
import VK_KHR_surface


const
  GgpStreamDescriptorSurfaceSpecVersion* = 1
  GgpStreamDescriptorSurfaceExtensionName* = "VK_GGP_stream_descriptor_surface"

type
  StreamDescriptorSurfaceCreateFlagsGGP* = distinct Flags
  StreamDescriptorSurfaceCreateInfoGGP* = object
    sType*: StructureType
    pNext*: pointer
    flags*: StreamDescriptorSurfaceCreateFlagsGGP
    streamDescriptor*: GgpStreamDescriptor

var # commands
  createStreamDescriptorSurfaceGGPCage: proc(instance: Instance; pCreateInfo: ptr StreamDescriptorSurfaceCreateInfoGGP; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createStreamDescriptorSurfaceGGP*(
      instance: Instance;
      pCreateInfo: ptr StreamDescriptorSurfaceCreateInfoGGP;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createStreamDescriptorSurfaceGGPCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_GGP_stream_descriptor_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createStreamDescriptorSurfaceGGPCage << "vkCreateStreamDescriptorSurfaceGGP"