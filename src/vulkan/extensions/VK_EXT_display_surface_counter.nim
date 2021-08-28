# Generated at 2021-08-28T12:28:00Z
# VK_EXT_display_surface_counter
# =================================

import ../platform
import ../features/vk10
import VK_KHR_display


const
  ExtDisplaySurfaceCounterSpecVersion* = 1
  ExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

type
  SurfaceCounterFlagsEXT* = Flags[SurfaceCounterFlagBitsEXT]
  SurfaceCounterFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    vblankExt = 0x00000001
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
  surfaceCapabilities2Ext as surfaceCapabilities2Ext

proc loadVK_EXT_display_surface_counter*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSurfaceCapabilities2EXTCage << "vkGetPhysicalDeviceSurfaceCapabilities2EXT"
