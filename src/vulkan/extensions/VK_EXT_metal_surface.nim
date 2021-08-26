
import ../platform
import ../features/vk10
import VK_KHR_surface




type
  MetalSurfaceCreateFlagsEXT* = distinct Flags
  MetalSurfaceCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: MetalSurfaceCreateFlagsEXT
    pLayer*: ptr CAMetalLayer
  CAMetalLayer* = distinct object

var # commands
  createMetalSurfaceEXTCage: proc(instance: Instance; pCreateInfo: ptr MetalSurfaceCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc createMetalSurfaceEXT*(
      instance: Instance;
      pCreateInfo: ptr MetalSurfaceCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createMetalSurfaceEXTCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_EXT_metal_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  createMetalSurfaceEXTCage << "vkCreateMetalSurfaceEXT"