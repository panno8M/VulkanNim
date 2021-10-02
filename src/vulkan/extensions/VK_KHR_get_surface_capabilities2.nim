# Generated at 2021-10-02T09:29:44Z
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
    sType* {.constant: (StructureType.physicalDeviceSurfaceInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    surface*: SurfaceKHR
  SurfaceCapabilities2KHR* = object
    sType* {.constant: (StructureType.surfaceCapabilities2Khr).}: StructureType
    pNext* {.optional.}: pointer
    surfaceCapabilities*: SurfaceCapabilitiesKHR
  SurfaceFormat2KHR* = object
    sType* {.constant: (StructureType.surfaceFormat2Khr).}: StructureType
    pNext* {.optional.}: pointer
    surfaceFormat*: SurfaceFormatKHR

proc getPhysicalDeviceSurfaceCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2KHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorSurfaceLostKhr),
      lazyload("vkGetPhysicalDeviceSurfaceCapabilities2KHR", InstanceLevel).}
proc getPhysicalDeviceSurfaceFormats2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats {.length: pSurfaceFormatCount.} = default(arrPtr[SurfaceFormat2KHR]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorSurfaceLostKhr),
      lazyload("vkGetPhysicalDeviceSurfaceFormats2KHR", InstanceLevel).}

proc loadAllVK_KHR_get_surface_capabilities2*(instance: Instance) =
  getPhysicalDeviceSurfaceCapabilities2KHR.load(instance)
  getPhysicalDeviceSurfaceFormats2KHR.load(instance)

proc loadVK_KHR_get_surface_capabilities2*(instance: Instance) =
  getPhysicalDeviceSurfaceCapabilities2KHR.load(instance)
  getPhysicalDeviceSurfaceFormats2KHR.load(instance)

