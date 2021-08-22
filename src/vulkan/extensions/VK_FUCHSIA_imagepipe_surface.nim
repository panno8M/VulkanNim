
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  ImagePipeSurfaceCreateInfoFUCHSIA* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ImagePipeSurfaceCreateFlagsFUCHSIA
    imagePipeHandle*: zx_handle_t
  ImagePipeSurfaceCreateFlagsFUCHSIA* = Flags

const FuchsiaImagepipeSurfaceSpecVersion* = 1
const FuchsiaImagepipeSurfaceExtensionName* = "VK_FUCHSIA_imagepipe_surface"
var # commands
  createImagePipeSurfaceFUCHSIACage: proc(instance: Instance; pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}

proc createImagePipeSurfaceFUCHSIA*(
      instance: Instance;
      pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl.} =
  createImagePipeSurfaceFUCHSIACage(instance,pCreateInfo,pAllocator,pSurface)


proc loadVK_FUCHSIA_imagepipe_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createImagePipeSurfaceFUCHSIACage << "vkCreateImagePipeSurfaceFUCHSIA"