# Generated at 2021-09-12T04:58:24Z
# VK_EXT_display_surface_counter


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  ExtDisplaySurfaceCounterSpecVersion* = 1
  ExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

type # enums and bitmasks
  SurfaceCounterFlagsEXT* = Flags[SurfaceCounterFlagBitsEXT]
  SurfaceCounterFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    vblankExt = 0x00000001

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
    supportedTransforms* {.optional.}: SurfaceTransformFlagsKHR
    currentTransform*: SurfaceTransformFlagBitsKHR
    supportedCompositeAlpha* {.optional.}: CompositeAlphaFlagsKHR
    supportedUsageFlags* {.optional.}: ImageUsageFlags
    supportedSurfaceCounters* {.optional.}: SurfaceCounterFlagsEXT

proc getPhysicalDeviceSurfaceCapabilities2EXT*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2EXT;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceSurfaceCapabilities2EXT", InstanceLevel).}
StructureType.defineAliases:
  surfaceCapabilities2Ext as surfaceCapabilities2Ext


proc loadAllVK_EXT_display_surface_counter*(instance: Instance) =
  getPhysicalDeviceSurfaceCapabilities2EXT.load(instance)

proc loadVK_EXT_display_surface_counter*(instance: Instance) =
  getPhysicalDeviceSurfaceCapabilities2EXT.load(instance)

