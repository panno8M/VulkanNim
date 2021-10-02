# Generated at 2021-10-02T09:29:45Z
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
    sType* {.constant: (StructureType.imagepipeSurfaceCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ImagePipeSurfaceCreateFlagsFUCHSIA
    imagePipeHandle*: zx_handle_t

proc createImagePipeSurfaceFUCHSIA*(
      instance: Instance;
      pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkCreateImagePipeSurfaceFUCHSIA", InstanceLevel).}

proc loadAllVK_FUCHSIA_imagepipe_surface*(instance: Instance) =
  createImagePipeSurfaceFUCHSIA.load(instance)

proc loadVK_FUCHSIA_imagepipe_surface*(instance: Instance) =
  createImagePipeSurfaceFUCHSIA.load(instance)

