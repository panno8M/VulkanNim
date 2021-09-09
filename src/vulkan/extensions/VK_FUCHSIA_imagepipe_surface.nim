# Generated at 2021-09-09T01:49:36Z
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

proc createImagePipeSurfaceFUCHSIA*(
      instance: Instance;
      pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, lazyload("vkCreateImagePipeSurfaceFUCHSIA", InstanceLevel).}

proc loadAllVK_FUCHSIA_imagepipe_surface*(instance: Instance) =
  createImagePipeSurfaceFUCHSIA.smartLoad(instance)

proc loadVK_FUCHSIA_imagepipe_surface*(instance: Instance) =
  createImagePipeSurfaceFUCHSIA.smartLoad(instance)

