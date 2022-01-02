# VK_KHR_get_surface_capabilities2

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrGetSurfaceCapabilities2SpecVersion* = 1
  KhrGetSurfaceCapabilities2ExtensionName* = "VK_KHR_get_surface_capabilities2"

type
  PhysicalDeviceSurfaceInfo2KHR* = object
    sType* {.constant: (StructureType.physicalDeviceSurfaceInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    surface* {.optional.}: SurfaceKHR
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfaceCapabilities2KHR", InstanceLevel).}
proc getPhysicalDeviceSurfaceFormats2KHR*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats {.length: pSurfaceFormatCount.} = default(arrPtr[SurfaceFormat2KHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfaceFormats2KHR", InstanceLevel).}

proc loadAllVK_KHR_get_surface_capabilities2*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSurfaceCapabilities2KHR
  getPhysicalDeviceSurfaceFormats2KHR
proc loadVK_KHR_get_surface_capabilities2*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSurfaceCapabilities2KHR
  getPhysicalDeviceSurfaceFormats2KHR
