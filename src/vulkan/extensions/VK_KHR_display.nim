
import ../platform
import ../features/vk10
import VK_KHR_surface




type
  DisplayKHR* = distinct NonDispatchableHandle
  DisplayModeCreateFlagsKHR* = distinct Flags
  DisplayModeCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DisplayModeCreateFlagsKHR
    parameters*: DisplayModeParametersKHR
  DisplayModeKHR* = distinct NonDispatchableHandle
  DisplayModeParametersKHR* = object
    visibleRegion*: Extent2D
    refreshRate*: uint32
  DisplayModePropertiesKHR* = object
    displayMode*: DisplayModeKHR
    parameters*: DisplayModeParametersKHR
  DisplayPlaneAlphaFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    OpaqueBitKhr = 0x00000001
    GlobalBitKhr = 0x00000002
    PerPixelBitKhr = 0x00000004
    PerPixelPremultipliedBitKhr = 0x00000008
  DisplayPlaneAlphaFlagsKHR* = distinct Flags
  DisplayPlaneCapabilitiesKHR* = object
    supportedAlpha*: DisplayPlaneAlphaFlagsKHR
    minSrcPosition*: Offset2D
    maxSrcPosition*: Offset2D
    minSrcExtent*: Extent2D
    maxSrcExtent*: Extent2D
    minDstPosition*: Offset2D
    maxDstPosition*: Offset2D
    minDstExtent*: Extent2D
    maxDstExtent*: Extent2D
  DisplayPlanePropertiesKHR* = object
    currentDisplay*: DisplayKHR
    currentStackIndex*: uint32
  DisplayPropertiesKHR* = object
    display*: DisplayKHR
    displayName*: cstring
    physicalDimensions*: Extent2D
    physicalResolution*: Extent2D
    supportedTransforms*: SurfaceTransformFlagsKHR
    planeReorderPossible*: Bool32
    persistentContent*: Bool32
  DisplaySurfaceCreateFlagsKHR* = distinct Flags
  DisplaySurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DisplaySurfaceCreateFlagsKHR
    displayMode*: DisplayModeKHR
    planeIndex*: uint32
    planeStackIndex*: uint32
    transform*: SurfaceTransformFlagBitsKHR
    globalAlpha*: float32
    alphaMode*: DisplayPlaneAlphaFlagBitsKHR
    imageExtent*: Extent2D
  SurfaceTransformFlagsKHR* = distinct Flags

var # commands
  getPhysicalDeviceDisplayPropertiesKHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayPropertiesKHR;): Result {.cdecl.}
  getPhysicalDeviceDisplayPlanePropertiesKHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayPlanePropertiesKHR;): Result {.cdecl.}
  getDisplayPlaneSupportedDisplaysKHRCage: proc(physicalDevice: PhysicalDevice; planeIndex: uint32; pDisplayCount: ptr uint32; pDisplays: ptr DisplayKHR;): Result {.cdecl.}
  getDisplayModePropertiesKHRCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr DisplayModePropertiesKHR;): Result {.cdecl.}
  createDisplayModeKHRCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR; pCreateInfo: ptr DisplayModeCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pMode: ptr DisplayModeKHR;): Result {.cdecl.}
  getDisplayPlaneCapabilitiesKHRCage: proc(physicalDevice: PhysicalDevice; mode: DisplayModeKHR; planeIndex: uint32; pCapabilities: ptr DisplayPlaneCapabilitiesKHR;): Result {.cdecl.}
  createDisplayPlaneSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr DisplaySurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
proc getPhysicalDeviceDisplayPropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayPropertiesKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceDisplayPropertiesKHRCage(physicalDevice,pPropertyCount,pProperties)
proc getPhysicalDeviceDisplayPlanePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayPlanePropertiesKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceDisplayPlanePropertiesKHRCage(physicalDevice,pPropertyCount,pProperties)
proc getDisplayPlaneSupportedDisplaysKHR*(
      physicalDevice: PhysicalDevice;
      planeIndex: uint32;
      pDisplayCount: ptr uint32;
      pDisplays: ptr DisplayKHR;
    ): Result {.cdecl, discardable.} =
  getDisplayPlaneSupportedDisplaysKHRCage(physicalDevice,planeIndex,pDisplayCount,pDisplays)
proc getDisplayModePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayModePropertiesKHR;
    ): Result {.cdecl, discardable.} =
  getDisplayModePropertiesKHRCage(physicalDevice,display,pPropertyCount,pProperties)
proc createDisplayModeKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pCreateInfo: ptr DisplayModeCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pMode: ptr DisplayModeKHR;
    ): Result {.cdecl, discardable.} =
  createDisplayModeKHRCage(physicalDevice,display,pCreateInfo,pAllocator,pMode)
proc getDisplayPlaneCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      mode: DisplayModeKHR;
      planeIndex: uint32;
      pCapabilities: ptr DisplayPlaneCapabilitiesKHR;
    ): Result {.cdecl, discardable.} =
  getDisplayPlaneCapabilitiesKHRCage(physicalDevice,mode,planeIndex,pCapabilities)
proc createDisplayPlaneSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr DisplaySurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl, discardable.} =
  createDisplayPlaneSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)
proc loadVK_KHR_display*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceDisplayPropertiesKHRCage << "vkGetPhysicalDeviceDisplayPropertiesKHR"
  getPhysicalDeviceDisplayPlanePropertiesKHRCage << "vkGetPhysicalDeviceDisplayPlanePropertiesKHR"
  getDisplayPlaneSupportedDisplaysKHRCage << "vkGetDisplayPlaneSupportedDisplaysKHR"
  getDisplayModePropertiesKHRCage << "vkGetDisplayModePropertiesKHR"
  createDisplayModeKHRCage << "vkCreateDisplayModeKHR"
  getDisplayPlaneCapabilitiesKHRCage << "vkGetDisplayPlaneCapabilitiesKHR"
  createDisplayPlaneSurfaceKHRCage << "vkCreateDisplayPlaneSurfaceKHR"