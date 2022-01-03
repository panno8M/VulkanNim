# VK_KHR_swapchain
# VK_KHR_display
# VK_KHR_display_swapchain
# VK_EXT_direct_mode_display
# VK_EXT_display_surface_counter
# VK_EXT_display_control
# VK_GOOGLE_display_timing
# VK_EXT_swapchain_colorspace
# VK_KHR_get_display_properties2
# VK_KHR_swapchain_mutable_format
# VK_AMD_display_native_hdr
# VK_EXT_acquire_drm_display
# VK_NV_acquire_winrt_display

import ../../features/vk10
import ../../platform
prepareVulkanLibDef()

const
  KhrSwapchainSpecVersion* = 70
  KhrSwapchainExtensionName* = "VK_KHR_swapchain"

  KhrDisplaySpecVersion* = 23
  KhrDisplayExtensionName* = "VK_KHR_display"

  KhrDisplaySwapchainSpecVersion* = 10
  KhrDisplaySwapchainExtensionName* = "VK_KHR_display_swapchain"

  ExtDirectModeDisplaySpecVersion* = 1
  ExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

  ExtDisplaySurfaceCounterSpecVersion* = 1
  ExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

  ExtDisplayControlSpecVersion* = 1
  ExtDisplayControlExtensionName* = "VK_EXT_display_control"

  GoogleDisplayTimingSpecVersion* = 1
  GoogleDisplayTimingExtensionName* = "VK_GOOGLE_display_timing"

  ExtSwapchainColorSpaceSpecVersion* = 4
  ExtSwapchainColorSpaceExtensionName* = "VK_EXT_swapchain_colorspace"

  KhrGetDisplayProperties2SpecVersion* = 1
  KhrGetDisplayProperties2ExtensionName* = "VK_KHR_get_display_properties2"

  KhrSwapchainMutableFormatSpecVersion* = 1
  KhrSwapchainMutableFormatExtensionName* = "VK_KHR_swapchain_mutable_format"

  AmdDisplayNativeHdrSpecVersion* = 1
  AmdDisplayNativeHdrExtensionName* = "VK_AMD_display_native_hdr"

  ExtAcquireDrmDisplaySpecVersion* = 1
  ExtAcquireDrmDisplayExtensionName* = "VK_EXT_acquire_drm_display"

  NvAcquireWinrtDisplaySpecVersion* = 1
  NvAcquireWinrtDisplayExtensionName* = "VK_NV_acquire_winrt_display"

type
  SwapchainCreateInfoKHR* = object
    sType* {.constant: (StructureType.swapchainCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SwapchainCreateFlagsKHR
    surface*: SurfaceKHR
    minImageCount*: uint32
    imageFormat*: Format
    imageColorSpace*: ColorSpaceKHR
    imageExtent*: Extent2D
    imageArrayLayers*: uint32
    imageUsage*: ImageUsageFlags
    imageSharingMode*: SharingMode
    queueFamilyIndexCount* {.optional.}: uint32
    pQueueFamilyIndices* {.length: queueFamilyIndexCount.}: arrPtr[uint32]
    preTransform*: SurfaceTransformFlagBitsKHR
    compositeAlpha*: CompositeAlphaFlagBitsKHR
    presentMode*: PresentModeKHR
    clipped*: Bool32
    oldSwapchain* {.optional.}: SwapchainKHR
  PresentInfoKHR* = object
    sType* {.constant: (StructureType.presentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphores* {.length: waitSemaphoreCount.}: arrPtr[Semaphore]
    swapchainCount*: uint32
    pSwapchains* {.length: swapchainCount.}: arrPtr[SwapchainKHR]
    pImageIndices* {.length: swapchainCount.}: arrPtr[uint32]
    pResults* {.optional, length: swapchainCount.}: arrPtr[Result]

  ImageSwapchainCreateInfoKHR* = object
    sType* {.constant: (StructureType.imageSwapchainCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchain* {.optional.}: SwapchainKHR
  BindImageMemorySwapchainInfoKHR* = object
    sType* {.constant: (StructureType.bindImageMemorySwapchainInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchain*: SwapchainKHR
    imageIndex*: uint32
  AcquireNextImageInfoKHR* = object
    sType* {.constant: (StructureType.acquireNextImageInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchain*: SwapchainKHR
    timeout*: uint64
    semaphore* {.optional.}: Semaphore
    fence* {.optional.}: Fence
    deviceMask*: uint32
  DeviceGroupPresentCapabilitiesKHR* = object
    sType* {.constant: (StructureType.deviceGroupPresentCapabilitiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    presentMask*: array[MaxDeviceGroupSize, uint32]
    modes*: DeviceGroupPresentModeFlagsKHR
  DeviceGroupPresentInfoKHR* = object
    sType* {.constant: (StructureType.deviceGroupPresentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchainCount* {.optional.}: uint32
    pDeviceMasks* {.length: swapchainCount.}: arrPtr[uint32]
    mode*: DeviceGroupPresentModeFlagBitsKHR
  DeviceGroupSwapchainCreateInfoKHR* = object
    sType* {.constant: (StructureType.deviceGroupSwapchainCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    modes*: DeviceGroupPresentModeFlagsKHR

  DisplayModeCreateInfoKHR* = object
    sType* {.constant: (StructureType.displayModeCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DisplayModeCreateFlagsKHR
    parameters*: DisplayModeParametersKHR
  DisplayModeParametersKHR* = object
    visibleRegion*: Extent2D
    refreshRate*: uint32
  DisplayModePropertiesKHR* = object
    displayMode*: DisplayModeKHR
    parameters*: DisplayModeParametersKHR
  DisplayPlaneCapabilitiesKHR* = object
    supportedAlpha* {.optional.}: DisplayPlaneAlphaFlagsKHR
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
    supportedTransforms* {.optional.}: SurfaceTransformFlagsKHR
    planeReorderPossible*: Bool32
    persistentContent*: Bool32
  DisplaySurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.displaySurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DisplaySurfaceCreateFlagsKHR
    displayMode*: DisplayModeKHR
    planeIndex*: uint32
    planeStackIndex*: uint32
    transform*: SurfaceTransformFlagBitsKHR
    globalAlpha*: float32
    alphaMode*: DisplayPlaneAlphaFlagBitsKHR
    imageExtent*: Extent2D

  DisplayPresentInfoKHR* = object
    sType* {.constant: (StructureType.displayPresentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    srcRect*: Rect2D
    dstRect*: Rect2D
    persistent*: Bool32

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

  DisplayPowerInfoEXT* = object
    sType* {.constant: (StructureType.displayPowerInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    powerState*: DisplayPowerStateEXT
  DeviceEventInfoEXT* = object
    sType* {.constant: (StructureType.deviceEventInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    deviceEvent*: DeviceEventTypeEXT
  DisplayEventInfoEXT* = object
    sType* {.constant: (StructureType.displayEventInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    displayEvent*: DisplayEventTypeEXT
  SwapchainCounterCreateInfoEXT* = object
    sType* {.constant: (StructureType.swapchainCounterCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    surfaceCounters* {.optional.}: SurfaceCounterFlagsEXT

  RefreshCycleDurationGOOGLE* = object
    refreshDuration*: uint64
  PastPresentationTimingGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64
    actualPresentTime*: uint64
    earliestPresentTime*: uint64
    presentMargin*: uint64
  PresentTimesInfoGOOGLE* = object
    sType* {.constant: (StructureType.presentTimesInfoGoogle).}: StructureType
    pNext* {.optional.}: pointer
    swapchainCount*: uint32
    pTimes* {.optional, length: swapchainCount.}: arrPtr[PresentTimeGOOGLE]
  PresentTimeGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64

  DisplayProperties2KHR* = object
    sType* {.constant: (StructureType.displayProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    displayProperties*: DisplayPropertiesKHR
  DisplayPlaneProperties2KHR* = object
    sType* {.constant: (StructureType.displayPlaneProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    displayPlaneProperties*: DisplayPlanePropertiesKHR
  DisplayModeProperties2KHR* = object
    sType* {.constant: (StructureType.displayModeProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    displayModeProperties*: DisplayModePropertiesKHR
  DisplayPlaneInfo2KHR* = object
    sType* {.constant: (StructureType.displayPlaneInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    mode*: DisplayModeKHR
    planeIndex*: uint32
  DisplayPlaneCapabilities2KHR* = object
    sType* {.constant: (StructureType.displayPlaneCapabilities2Khr).}: StructureType
    pNext* {.optional.}: pointer
    capabilities*: DisplayPlaneCapabilitiesKHR

  DisplayNativeHdrSurfaceCapabilitiesAMD* = object
    sType* {.constant: (StructureType.displayNativeHdrSurfaceCapabilitiesAmd).}: StructureType
    pNext* {.optional.}: pointer
    localDimmingSupport*: Bool32
  SwapchainDisplayNativeHdrCreateInfoAMD* = object
    sType* {.constant: (StructureType.swapchainDisplayNativeHdrCreateInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    localDimmingEnable*: Bool32

proc createSwapchainKHR*(
      device: Device;
      pCreateInfo: ptr SwapchainCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSwapchain: ptr SwapchainKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost, Result.errorSurfaceLostKhr, Result.errorNativeWindowInUseKhr, Result.errorInitializationFailed],
      lazyload("vkCreateSwapchainKHR", DeviceLevel).}
proc destroySwapchainKHR*(
      device: Device;
      swapchain = default(SwapchainKHR);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroySwapchainKHR", DeviceLevel).}
proc getSwapchainImagesKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pSwapchainImageCount: ptr uint32;
      pSwapchainImages {.length: pSwapchainImageCount.} = default(arrPtr[Image]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetSwapchainImagesKHR", DeviceLevel).}
proc acquireNextImageKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      timeout: uint64;
      semaphore = default(Semaphore);
      fence = default(Fence);
      pImageIndex: ptr uint32;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.timeout, Result.notReady, Result.suboptimalKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost, Result.errorOutOfDateKhr, Result.errorSurfaceLostKhr, Result.errorFullScreenExclusiveModeLostExt],
      lazyload("vkAcquireNextImageKHR", DeviceLevel).}
proc queuePresentKHR*(
      queue: Queue;
      pPresentInfo: ptr PresentInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.suboptimalKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost, Result.errorOutOfDateKhr, Result.errorSurfaceLostKhr, Result.errorFullScreenExclusiveModeLostExt],
      lazyload("vkQueuePresentKHR", DeviceLevel).}


proc getDeviceGroupPresentCapabilitiesKHR*(
      device: Device;
      pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDeviceGroupPresentCapabilitiesKHR", DeviceLevel).}
proc getDeviceGroupSurfacePresentModesKHR*(
      device: Device;
      surface: SurfaceKHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetDeviceGroupSurfacePresentModesKHR", DeviceLevel).}
proc getPhysicalDevicePresentRectanglesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pRectCount: ptr uint32;
      pRects {.length: pRectCount.} = default(arrPtr[Rect2D]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDevicePresentRectanglesKHR", InstanceLevel).}
proc acquireNextImage2KHR*(
      device: Device;
      pAcquireInfo: ptr AcquireNextImageInfoKHR;
      pImageIndex: ptr uint32;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.timeout, Result.notReady, Result.suboptimalKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost, Result.errorOutOfDateKhr, Result.errorSurfaceLostKhr, Result.errorFullScreenExclusiveModeLostExt],
      lazyload("vkAcquireNextImage2KHR", DeviceLevel).}


proc getPhysicalDeviceDisplayPropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayPropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDeviceDisplayPropertiesKHR", InstanceLevel).}
proc getPhysicalDeviceDisplayPlanePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayPlanePropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDeviceDisplayPlanePropertiesKHR", InstanceLevel).}
proc getDisplayPlaneSupportedDisplaysKHR*(
      physicalDevice: PhysicalDevice;
      planeIndex: uint32;
      pDisplayCount: ptr uint32;
      pDisplays {.length: pDisplayCount.} = default(arrPtr[DisplayKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayPlaneSupportedDisplaysKHR", InstanceLevel).}
proc getDisplayModePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayModePropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayModePropertiesKHR", InstanceLevel).}
proc createDisplayModeKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pCreateInfo: ptr DisplayModeCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pMode: ptr DisplayModeKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed],
      lazyload("vkCreateDisplayModeKHR", InstanceLevel).}
proc getDisplayPlaneCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      mode: DisplayModeKHR;
      planeIndex: uint32;
      pCapabilities: ptr DisplayPlaneCapabilitiesKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayPlaneCapabilitiesKHR", InstanceLevel).}
proc createDisplayPlaneSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr DisplaySurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateDisplayPlaneSurfaceKHR", InstanceLevel).}


proc createSharedSwapchainsKHR*(
      device: Device;
      swapchainCount: uint32;
      pCreateInfos {.length: swapchainCount.}: arrPtr[SwapchainCreateInfoKHR];
      pAllocator = default(ptr AllocationCallbacks);
      pSwapchains {.length: swapchainCount.}: arrPtr[SwapchainKHR];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorIncompatibleDisplayKhr, Result.errorDeviceLost, Result.errorSurfaceLostKhr],
      lazyload("vkCreateSharedSwapchainsKHR", DeviceLevel).}


proc releaseDisplayEXT*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      lazyload("vkReleaseDisplayEXT", InstanceLevel).}


proc getPhysicalDeviceSurfaceCapabilities2EXT*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilities2EXT;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorSurfaceLostKhr],
      lazyload("vkGetPhysicalDeviceSurfaceCapabilities2EXT", InstanceLevel).}


proc displayPowerControlEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayPowerInfo: ptr DisplayPowerInfoEXT;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkDisplayPowerControlEXT", DeviceLevel).}
proc registerDeviceEventEXT*(
      device: Device;
      pDeviceEventInfo: ptr DeviceEventInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pFence: ptr Fence;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkRegisterDeviceEventEXT", DeviceLevel).}
proc registerDisplayEventEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayEventInfo: ptr DisplayEventInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pFence: ptr Fence;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkRegisterDisplayEventEXT", DeviceLevel).}
proc getSwapchainCounterEXT*(
      device: Device;
      swapchain: SwapchainKHR;
      counter: SurfaceCounterFlagBitsEXT;
      pCounterValue: ptr uint64;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorDeviceLost, Result.errorOutOfDateKhr],
      lazyload("vkGetSwapchainCounterEXT", DeviceLevel).}


proc getRefreshCycleDurationGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pDisplayTimingProperties: ptr RefreshCycleDurationGOOGLE;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorDeviceLost, Result.errorSurfaceLostKhr],
      lazyload("vkGetRefreshCycleDurationGOOGLE", DeviceLevel).}
proc getPastPresentationTimingGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pPresentationTimingCount: ptr uint32;
      pPresentationTimings {.length: pPresentationTimingCount.} = default(arrPtr[PastPresentationTimingGOOGLE]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorDeviceLost, Result.errorOutOfDateKhr, Result.errorSurfaceLostKhr],
      lazyload("vkGetPastPresentationTimingGOOGLE", DeviceLevel).}


proc getPhysicalDeviceDisplayProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayProperties2KHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDeviceDisplayProperties2KHR", InstanceLevel).}
proc getPhysicalDeviceDisplayPlaneProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayPlaneProperties2KHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDeviceDisplayPlaneProperties2KHR", InstanceLevel).}
proc getDisplayModeProperties2KHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayModeProperties2KHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayModeProperties2KHR", InstanceLevel).}
proc getDisplayPlaneCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pDisplayPlaneInfo: ptr DisplayPlaneInfo2KHR;
      pCapabilities: ptr DisplayPlaneCapabilities2KHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayPlaneCapabilities2KHR", InstanceLevel).}


proc setLocalDimmingAMD*(
      device: Device;
      swapChain: SwapchainKHR;
      localDimmingEnable: Bool32;
    ): void {.cdecl, lazyload("vkSetLocalDimmingAMD", DeviceLevel).}


proc acquireDrmDisplayEXT*(
      physicalDevice: PhysicalDevice;
      drmFd: int32;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed],
      lazyload("vkAcquireDrmDisplayEXT", InstanceLevel).}
proc getDrmDisplayEXT*(
      physicalDevice: PhysicalDevice;
      drmFd: int32;
      connectorId: uint32;
      display: ptr DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorOutOfHostMemory],
      lazyload("vkGetDrmDisplayEXT", InstanceLevel).}


proc acquireWinrtDisplayNV*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorDeviceLost, Result.errorInitializationFailed],
      lazyload("vkAcquireWinrtDisplayNV", InstanceLevel).}
proc getWinrtDisplayNV*(
      physicalDevice: PhysicalDevice;
      deviceRelativeId: uint32;
      pDisplay: ptr DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorDeviceLost, Result.errorInitializationFailed],
      lazyload("vkGetWinrtDisplayNV", InstanceLevel).}

proc loadAllVK_KHR_swapchain*(instance: Instance) = instance.loadCommands:
  createSwapchainKHR
  destroySwapchainKHR
  getSwapchainImagesKHR
  acquireNextImageKHR
  queuePresentKHR
  getDeviceGroupPresentCapabilitiesKHR
  getDeviceGroupSurfacePresentModesKHR
  getPhysicalDevicePresentRectanglesKHR
  acquireNextImage2KHR
proc loadAllVK_KHR_display*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceDisplayPropertiesKHR
  getPhysicalDeviceDisplayPlanePropertiesKHR
  getDisplayPlaneSupportedDisplaysKHR
  getDisplayModePropertiesKHR
  createDisplayModeKHR
  getDisplayPlaneCapabilitiesKHR
  createDisplayPlaneSurfaceKHR
proc loadAllVK_KHR_display_swapchain*(instance: Instance) = instance.loadCommands:
  createSharedSwapchainsKHR
proc loadAllVK_EXT_direct_mode_display*(instance: Instance) = instance.loadCommands:
  releaseDisplayEXT
proc loadAllVK_EXT_display_surface_counter*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSurfaceCapabilities2EXT
proc loadAllVK_EXT_display_control*(instance: Instance) = instance.loadCommands:
  displayPowerControlEXT
  registerDeviceEventEXT
  registerDisplayEventEXT
  getSwapchainCounterEXT
proc loadAllVK_GOOGLE_display_timing*(instance: Instance) = instance.loadCommands:
  getRefreshCycleDurationGOOGLE
  getPastPresentationTimingGOOGLE
proc loadAllVK_KHR_get_display_properties2*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceDisplayProperties2KHR
  getPhysicalDeviceDisplayPlaneProperties2KHR
  getDisplayModeProperties2KHR
  getDisplayPlaneCapabilities2KHR
proc loadAllVK_AMD_display_native_hdr*(instance: Instance) = instance.loadCommands:
  setLocalDimmingAMD
proc loadAllVK_EXT_acquire_drm_display*(instance: Instance) = instance.loadCommands:
  acquireDrmDisplayEXT
  getDrmDisplayEXT
proc loadAllVK_NV_acquire_winrt_display*(instance: Instance) = instance.loadCommands:
  acquireWinrtDisplayNV
  getWinrtDisplayNV
proc loadVK_KHR_swapchain*(instance: Instance) = instance.loadCommands:
  getPhysicalDevicePresentRectanglesKHR
proc loadVK_KHR_display*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceDisplayPropertiesKHR
  getPhysicalDeviceDisplayPlanePropertiesKHR
  getDisplayPlaneSupportedDisplaysKHR
  getDisplayModePropertiesKHR
  createDisplayModeKHR
  getDisplayPlaneCapabilitiesKHR
  createDisplayPlaneSurfaceKHR
proc loadVK_EXT_direct_mode_display*(instance: Instance) = instance.loadCommands:
  releaseDisplayEXT
proc loadVK_EXT_display_surface_counter*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSurfaceCapabilities2EXT
proc loadVK_KHR_get_display_properties2*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceDisplayProperties2KHR
  getPhysicalDeviceDisplayPlaneProperties2KHR
  getDisplayModeProperties2KHR
  getDisplayPlaneCapabilities2KHR
proc loadVK_EXT_acquire_drm_display*(instance: Instance) = instance.loadCommands:
  acquireDrmDisplayEXT
  getDrmDisplayEXT
proc loadVK_NV_acquire_winrt_display*(instance: Instance) = instance.loadCommands:
  acquireWinrtDisplayNV
  getWinrtDisplayNV
proc loadVK_KHR_swapchain*(device: Device) = device.loadCommands:
  createSwapchainKHR
  destroySwapchainKHR
  getSwapchainImagesKHR
  acquireNextImageKHR
  queuePresentKHR
  getDeviceGroupPresentCapabilitiesKHR
  getDeviceGroupSurfacePresentModesKHR
  acquireNextImage2KHR
proc loadVK_KHR_display_swapchain*(device: Device) = device.loadCommands:
  createSharedSwapchainsKHR
proc loadVK_EXT_display_control*(device: Device) = device.loadCommands:
  displayPowerControlEXT
  registerDeviceEventEXT
  registerDisplayEventEXT
  getSwapchainCounterEXT
proc loadVK_GOOGLE_display_timing*(device: Device) = device.loadCommands:
  getRefreshCycleDurationGOOGLE
  getPastPresentationTimingGOOGLE
proc loadVK_AMD_display_native_hdr*(device: Device) = device.loadCommands:
  setLocalDimmingAMD
