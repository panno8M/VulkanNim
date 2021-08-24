
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  MetalSurfaceCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: MetalSurfaceCreateFlagsEXT
    pLayer*: ptr CAMetalLayer
  MetalSurfaceCreateFlagsEXT* = distinct Flags
  CAMetalLayer* = distinct object

const ExtMetalSurfaceSpecVersion* = 1
const ExtMetalSurfaceExtensionName* = "VK_EXT_metal_surface"
var # commands
  createMetalSurfaceEXTCage: proc(instance: Instance; pCreateInfo: ptr MetalSurfaceCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}

proc createMetalSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr MetalSurfaceCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl.} =
  createMetalSurfaceEXTCage(instance,pCreateInfo,pAllocator,pSurface)


proc loadVK_EXT_metal_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createMetalSurfaceEXTCage << "vkCreateMetalSurfaceEXT"