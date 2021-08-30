# Generated at 2021-08-30T14:31:10Z
# VK_FUCHSIA_imagepipe_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface

const
  FuchsiaImagepipeSurfaceSpecVersion* = 1
  FuchsiaImagepipeSurfaceExtensionName* = "VK_FUCHSIA_imagepipe_surface"

type
  ImagePipeSurfaceCreateFlagsFUCHSIA* = Flags[distinct UnusedEnum]
  ImagePipeSurfaceCreateInfoFUCHSIA* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ImagePipeSurfaceCreateFlagsFUCHSIA
    imagePipeHandle*: zx_handle_t

var # commands
  createImagePipeSurfaceFUCHSIACage: proc(instance: Instance; pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createImagePipeSurfaceFUCHSIA*(
      instance: Instance;
      pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createImagePipeSurfaceFUCHSIACage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_FUCHSIA_imagepipe_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createImagePipeSurfaceFUCHSIACage << "vkCreateImagePipeSurfaceFUCHSIA"