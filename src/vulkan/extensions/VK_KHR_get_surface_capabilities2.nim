
import ../platform
import ../features/vk10
import VK_KHR_surface


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

const KhrGetSurfaceCapabilities2SpecVersion* = 1
const KhrGetSurfaceCapabilities2ExtensionName* = "VK_KHR_get_surface_capabilities2"
var # commands
  getPhysicalDeviceSurfaceFormats2KHRCage: proc(physicalDevice: PhysicalDevice; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr SurfaceFormat2KHR;): Result {.cdecl.}
  getPhysicalDeviceSurfaceCapabilities2KHRCage: proc(physicalDevice: PhysicalDevice; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pSurfaceCapabilities: ptr SurfaceCapabilities2KHR;): Result {.cdecl.}

proc getPhysicalDeviceSurfaceFormats2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats: ptr SurfaceFormat2KHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceSurfaceFormats2KHRCage(physicalDevice,pSurfaceInfo,pSurfaceFormatCount,pSurfaceFormats)

proc getPhysicalDeviceSurfaceCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2KHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceSurfaceCapabilities2KHRCage(physicalDevice,pSurfaceInfo,pSurfaceCapabilities)


proc loadVK_KHR_get_surface_capabilities2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSurfaceFormats2KHRCage << "vkGetPhysicalDeviceSurfaceFormats2KHR"
  getPhysicalDeviceSurfaceCapabilities2KHRCage << "vkGetPhysicalDeviceSurfaceCapabilities2KHR"