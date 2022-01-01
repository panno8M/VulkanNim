# VK_KHR_surface

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrSurfaceSpecVersion* = 25
  KhrSurfaceExtensionName* = "VK_KHR_surface"

type
  SurfaceCapabilitiesKHR* = object
    minImageCount*: uint32
    maxImageCount*: uint32
    currentExtent*: Extent2D
    minImageExtent*: Extent2D
    maxImageExtent*: Extent2D
    maxImageArrayLayers*: uint32
    supportedTransforms*: SurfaceTransformFlagsKHR
    currentTransform*: SurfaceTransformFlagBitsKHR
    supportedCompositeAlpha*: CompositeAlphaFlagsKHR
    supportedUsageFlags*: ImageUsageFlags
  SurfaceFormatKHR* = object
    format*: Format
    colorSpace*: ColorSpaceKHR

proc destroySurfaceKHR*(
      instance: Instance;
      surface = default(SurfaceKHR);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroySurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceSurfaceSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      surface: SurfaceKHR;
      pSupported: ptr Bool32;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfaceSupportKHR", InstanceLevel).}
proc getPhysicalDeviceSurfaceCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilitiesKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfaceCapabilitiesKHR", InstanceLevel).}
proc getPhysicalDeviceSurfaceFormatsKHR*(
      physicalDevice: PhysicalDevice;
      surface = default(SurfaceKHR);
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats {.length: pSurfaceFormatCount.} = default(arrPtr[SurfaceFormatKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfaceFormatsKHR", InstanceLevel).}
proc getPhysicalDeviceSurfacePresentModesKHR*(
      physicalDevice: PhysicalDevice;
      surface = default(SurfaceKHR);
      pPresentModeCount: ptr uint32;
      pPresentModes {.length: pPresentModeCount.} = default(arrPtr[PresentModeKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfacePresentModesKHR", InstanceLevel).}

proc loadAllVK_KHR_surface*(instance: Instance) = instance.loadCommands:
  destroySurfaceKHR
  getPhysicalDeviceSurfaceSupportKHR
  getPhysicalDeviceSurfaceCapabilitiesKHR
  getPhysicalDeviceSurfaceFormatsKHR
  getPhysicalDeviceSurfacePresentModesKHR
proc loadVK_KHR_surface*(instance: Instance) = instance.loadCommands:
  destroySurfaceKHR
  getPhysicalDeviceSurfaceSupportKHR
  getPhysicalDeviceSurfaceCapabilitiesKHR
  getPhysicalDeviceSurfaceFormatsKHR
  getPhysicalDeviceSurfacePresentModesKHR
