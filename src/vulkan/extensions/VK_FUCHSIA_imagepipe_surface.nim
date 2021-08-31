# Generated at 2021-08-31T01:03:35Z
# VK_FUCHSIA_imagepipe_surface


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  FuchsiaImagepipeSurfaceSpecVersion* = 1
  FuchsiaImagepipeSurfaceExtensionName* = "VK_FUCHSIA_imagepipe_surface"

type # enums and bitmasks
  ImagePipeSurfaceCreateFlagsFUCHSIA* = Flags[distinct UnusedEnum]

type
  ImagePipeSurfaceCreateInfoFUCHSIA* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ImagePipeSurfaceCreateFlagsFUCHSIA
    imagePipeHandle*: zx_handle_t

var # command cages
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