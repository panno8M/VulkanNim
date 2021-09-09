# Generated at 2021-09-09T01:49:36Z
# VK_KHR_get_surface_capabilities2


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

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

proc getPhysicalDeviceSurfaceCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2KHR;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceSurfaceCapabilities2KHR", InstanceLevel).}
proc getPhysicalDeviceSurfaceFormats2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats: ptr SurfaceFormat2KHR;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceSurfaceFormats2KHR", InstanceLevel).}

proc loadAllVK_KHR_get_surface_capabilities2*(instance: Instance) =
  getPhysicalDeviceSurfaceCapabilities2KHR.smartLoad(instance)
  getPhysicalDeviceSurfaceFormats2KHR.smartLoad(instance)

proc loadVK_KHR_get_surface_capabilities2*(instance: Instance) =
  getPhysicalDeviceSurfaceCapabilities2KHR.smartLoad(instance)
  getPhysicalDeviceSurfaceFormats2KHR.smartLoad(instance)

