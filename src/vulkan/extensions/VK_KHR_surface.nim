# Generated at 2021-08-30T22:51:47Z
# VK_KHR_surface
# VK_KHR_display


import ../platform
import ../features/vk10

const
  KhrSurfaceSpecVersion* = 25
  KhrSurfaceExtensionName* = "VK_KHR_surface"

  KhrDisplaySpecVersion* = 23
  KhrDisplayExtensionName* = "VK_KHR_display"

type
  HtSurfaceKHR = object of HandleType
  SurfaceKHR* = NonDispatchableHandle[HtSurfaceKHR]
  SurfaceTransformFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    identityKhr = 0x00000001
    rotate90Khr = 0x00000002
    rotate180Khr = 0x00000004
    rotate270Khr = 0x00000008
    horizontalMirrorKhr = 0x00000010
    horizontalMirrorRotate90Khr = 0x00000020
    horizontalMirrorRotate180Khr = 0x00000040
    horizontalMirrorRotate270Khr = 0x00000080
    inheritKhr = 0x00000100
  PresentModeKHR* {.size: sizeof(int32), pure.} = enum
    immediateKhr = 0
    mailboxKhr = 1
    fifoKhr = 2
    fifoRelaxedKhr = 3
    # Provided by VK_KHR_shared_presentable_image
    sharedDemandRefreshKhr = 1000111000
    # Provided by VK_KHR_shared_presentable_image
    sharedContinuousRefreshKhr = 1000111001
  ColorSpaceKHR* {.size: sizeof(int32), pure.} = enum
    srgbNonlinearKhr = 0
    # Provided by VK_EXT_swapchain_colorspace
    displayP3NonlinearExt = 1000104001
    # Provided by VK_EXT_swapchain_colorspace
    extendedSrgbLinearExt = 1000104002
    # Provided by VK_EXT_swapchain_colorspace
    displayP3LinearExt = 1000104003
    # Provided by VK_EXT_swapchain_colorspace
    dciP3NonlinearExt = 1000104004
    # Provided by VK_EXT_swapchain_colorspace
    bt709LinearExt = 1000104005
    # Provided by VK_EXT_swapchain_colorspace
    bt709NonlinearExt = 1000104006
    # Provided by VK_EXT_swapchain_colorspace
    bt2020LinearExt = 1000104007
    # Provided by VK_EXT_swapchain_colorspace
    hdr10St2084Ext = 1000104008
    # Provided by VK_EXT_swapchain_colorspace
    dolbyvisionExt = 1000104009
    # Provided by VK_EXT_swapchain_colorspace
    hdr10HlgExt = 1000104010
    # Provided by VK_EXT_swapchain_colorspace
    adobergbLinearExt = 1000104011
    # Provided by VK_EXT_swapchain_colorspace
    adobergbNonlinearExt = 1000104012
    # Provided by VK_EXT_swapchain_colorspace
    passThroughExt = 1000104013
    # Provided by VK_EXT_swapchain_colorspace
    extendedSrgbNonlinearExt = 1000104014
    # Provided by VK_AMD_display_native_hdr
    displayNativeAmd = 1000213000
  CompositeAlphaFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    opaqueKhr = 0x00000001
    preMultipliedKhr = 0x00000002
    postMultipliedKhr = 0x00000004
    inheritKhr = 0x00000008
  CompositeAlphaFlagsKHR* = Flags[CompositeAlphaFlagBitsKHR]
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

  HtDisplayKHR = object of HandleType
  DisplayKHR* = NonDispatchableHandle[HtDisplayKHR]
  DisplayModeCreateFlagsKHR* = Flags[distinct UnusedEnum]
  DisplayModeCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DisplayModeCreateFlagsKHR
    parameters*: DisplayModeParametersKHR
  HtDisplayModeKHR = object of HandleType
  DisplayModeKHR* = NonDispatchableHandle[HtDisplayModeKHR]
  DisplayModeParametersKHR* = object
    visibleRegion*: Extent2D
    refreshRate*: uint32
  DisplayModePropertiesKHR* = object
    displayMode*: DisplayModeKHR
    parameters*: DisplayModeParametersKHR
  DisplayPlaneAlphaFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    opaqueKhr = 0x00000001
    globalKhr = 0x00000002
    perPixelKhr = 0x00000004
    perPixelPremultipliedKhr = 0x00000008
  DisplayPlaneAlphaFlagsKHR* = Flags[DisplayPlaneAlphaFlagBitsKHR]
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
  DisplaySurfaceCreateFlagsKHR* = Flags[distinct UnusedEnum]
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
  SurfaceTransformFlagsKHR* = Flags[SurfaceTransformFlagBitsKHR]

ColorSpaceKHR.defineAliases:
  srgbNonlinearKhr as colorspaceSrgbNonlinearKhr # Backwards-compatible alias containing a typo

var # command cages
  destroySurfaceKHRCage: proc(instance: Instance; surface: SurfaceKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getPhysicalDeviceSurfaceSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; surface: SurfaceKHR; pSupported: ptr Bool32;): Result {.cdecl.}
  getPhysicalDeviceSurfaceCapabilitiesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pSurfaceCapabilities: ptr SurfaceCapabilitiesKHR;): Result {.cdecl.}
  getPhysicalDeviceSurfaceFormatsKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr SurfaceFormatKHR;): Result {.cdecl.}
  getPhysicalDeviceSurfacePresentModesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr PresentModeKHR;): Result {.cdecl.}
proc destroySurfaceKHR*(
      instance: Instance;
      surface: SurfaceKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySurfaceKHRCage(instance,surface,pAllocator)
proc getPhysicalDeviceSurfaceSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      surface: SurfaceKHR;
      pSupported: ptr Bool32;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceSupportKHRCage(physicalDevice,queueFamilyIndex,surface,pSupported)
proc getPhysicalDeviceSurfaceCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilitiesKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceCapabilitiesKHRCage(physicalDevice,surface,pSurfaceCapabilities)
proc getPhysicalDeviceSurfaceFormatsKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats: ptr SurfaceFormatKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceFormatsKHRCage(physicalDevice,surface,pSurfaceFormatCount,pSurfaceFormats)
proc getPhysicalDeviceSurfacePresentModesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pPresentModeCount: ptr uint32;
      pPresentModes: ptr PresentModeKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfacePresentModesKHRCage(physicalDevice,surface,pPresentModeCount,pPresentModes)


var # command cages
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
proc loadVK_KHR_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  destroySurfaceKHRCage << "vkDestroySurfaceKHR"
  getPhysicalDeviceSurfaceSupportKHRCage << "vkGetPhysicalDeviceSurfaceSupportKHR"
  getPhysicalDeviceSurfaceCapabilitiesKHRCage << "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"
  getPhysicalDeviceSurfaceFormatsKHRCage << "vkGetPhysicalDeviceSurfaceFormatsKHR"
  getPhysicalDeviceSurfacePresentModesKHRCage << "vkGetPhysicalDeviceSurfacePresentModesKHR"

  getPhysicalDeviceDisplayPropertiesKHRCage << "vkGetPhysicalDeviceDisplayPropertiesKHR"
  getPhysicalDeviceDisplayPlanePropertiesKHRCage << "vkGetPhysicalDeviceDisplayPlanePropertiesKHR"
  getDisplayPlaneSupportedDisplaysKHRCage << "vkGetDisplayPlaneSupportedDisplaysKHR"
  getDisplayModePropertiesKHRCage << "vkGetDisplayModePropertiesKHR"
  createDisplayModeKHRCage << "vkCreateDisplayModeKHR"
  getDisplayPlaneCapabilitiesKHRCage << "vkGetDisplayPlaneCapabilitiesKHR"
  createDisplayPlaneSurfaceKHRCage << "vkCreateDisplayPlaneSurfaceKHR"