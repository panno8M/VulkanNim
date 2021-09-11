# Generated at 2021-09-10T05:27:58Z
# VK_GOOGLE_display_timing


import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
export VK_KHR_swapchain

const
  GoogleDisplayTimingSpecVersion* = 1
  GoogleDisplayTimingExtensionName* = "VK_GOOGLE_display_timing"

type
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
    pTimes* {.optional.}: ptr PresentTimeGOOGLE
  PresentTimeGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64

proc getRefreshCycleDurationGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pDisplayTimingProperties: ptr RefreshCycleDurationGOOGLE;
    ): Result {.cdecl, lazyload("vkGetRefreshCycleDurationGOOGLE", DeviceLevel).}
proc getPastPresentationTimingGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pPresentationTimingCount: ptr uint32;
      pPresentationTimings: ptr PastPresentationTimingGOOGLE;
    ): Result {.cdecl, lazyload("vkGetPastPresentationTimingGOOGLE", DeviceLevel).}

proc loadAllVK_GOOGLE_display_timing*(instance: Instance) =
  getRefreshCycleDurationGOOGLE.smartLoad(instance)
  getPastPresentationTimingGOOGLE.smartLoad(instance)

proc loadVK_GOOGLE_display_timing*(device: Device) =
  getRefreshCycleDurationGOOGLE.smartLoad(device)
  getPastPresentationTimingGOOGLE.smartLoad(device)

