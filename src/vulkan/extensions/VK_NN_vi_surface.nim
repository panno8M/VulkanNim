
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  ViSurfaceCreateInfoNN* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ViSurfaceCreateFlagsNN
    window*: pointer
  ViSurfaceCreateFlagsNN* = distinct Flags

const NnViSurfaceSpecVersion* = 1
const NnViSurfaceExtensionName* = "VK_NN_vi_surface"
var # commands
  createViSurfaceNNCage: proc(instance: Instance; pCreateInfo: ptr ViSurfaceCreateInfoNN; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}

proc createViSurfaceNN*(
      instance: Instance;
      pCreateInfo: ptr ViSurfaceCreateInfoNN;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createViSurfaceNNCage(instance,pCreateInfo,pAllocator,pSurface)


proc loadVK_NN_vi_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createViSurfaceNNCage << "vkCreateViSurfaceNN"