# Generated at 2021-08-28T00:52:26Z
# VK_EXT_display_surface_counter
# =================================

import ../platform
import ../features/vk10
import VK_KHR_display


const
  ExtDisplaySurfaceCounterSpecVersion* = 1
  ExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

type
  SurfaceCounterFlagsEXT* = distinct Flags
  SurfaceCounterFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    VblankExt = 0x00000001
  SurfaceCapabilities2EXT* = object
    sType*: StructureType
    pNext*: pointer
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
    supportedSurfaceCounters*: SurfaceCounterFlagsEXT

var # commands
  getPhysicalDeviceSurfaceCapabilities2EXTCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pSurfaceCapabilities: ptr SurfaceCapabilities2EXT;): Result {.cdecl.}
proc getPhysicalDeviceSurfaceCapabilities2EXT*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2EXT;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceCapabilities2EXTCage(physicalDevice,surface,pSurfaceCapabilities)
StructureType.defineAliases:
  SurfaceCapabilities2Ext as SurfaceCapabilities2Ext

proc loadVK_EXT_display_surface_counter*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSurfaceCapabilities2EXTCage << "vkGetPhysicalDeviceSurfaceCapabilities2EXT"