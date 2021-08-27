
import ../platform
import ../features/vk10
import VK_KHR_surface


const
  KhrGetSurfaceCapabilities2SpecVersion* = 1
  KhrGetSurfaceCapabilities2ExtensionName* = "VK_KHR_get_surface_capabilities2"

type
  PhysicalDeviceSurfaceInfo2KHR* = object
    sType*: StructureType
    pNext*: pointer
    surface*: SurfaceKHR
  SurfaceCapabilities2KHR* = object
    sType*: StructureType
    pNext*: pointer
    surfaceCapabilities*: SurfaceCapabilitiesKHR
  SurfaceFormat2KHR* = object
    sType*: StructureType
    pNext*: pointer
    surfaceFormat*: SurfaceFormatKHR

var # commands
  getPhysicalDeviceSurfaceCapabilities2KHRCage: proc(physicalDevice: PhysicalDevice; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pSurfaceCapabilities: ptr SurfaceCapabilities2KHR;): Result {.cdecl.}
  getPhysicalDeviceSurfaceFormats2KHRCage: proc(physicalDevice: PhysicalDevice; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr SurfaceFormat2KHR;): Result {.cdecl.}
proc getPhysicalDeviceSurfaceCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2KHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceCapabilities2KHRCage(physicalDevice,pSurfaceInfo,pSurfaceCapabilities)
proc getPhysicalDeviceSurfaceFormats2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats: ptr SurfaceFormat2KHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceFormats2KHRCage(physicalDevice,pSurfaceInfo,pSurfaceFormatCount,pSurfaceFormats)
proc loadVK_KHR_get_surface_capabilities2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSurfaceCapabilities2KHRCage << "vkGetPhysicalDeviceSurfaceCapabilities2KHR"
  getPhysicalDeviceSurfaceFormats2KHRCage << "vkGetPhysicalDeviceSurfaceFormats2KHR"