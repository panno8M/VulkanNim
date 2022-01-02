# VK_EXT_display_surface_counter

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtDisplaySurfaceCounterSpecVersion* = 1
  ExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

type
  SurfaceCapabilities2EXT* = object
    sType* {.constant: (StructureType.surfaceCapabilities2Ext).}: StructureType
    pNext* {.optional.}: pointer
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
    supportedSurfaceCounters* {.optional.}: SurfaceCounterFlagsEXT

proc getPhysicalDeviceSurfaceCapabilities2EXT*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2EXT;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfaceCapabilities2EXT", InstanceLevel).}

proc loadAllVK_EXT_display_surface_counter*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSurfaceCapabilities2EXT
proc loadVK_EXT_display_surface_counter*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSurfaceCapabilities2EXT
