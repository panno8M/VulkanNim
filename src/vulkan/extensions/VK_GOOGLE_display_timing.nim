# Generated at 2021-08-27T06:01:02Z
# VK_GOOGLE_display_timing
# =================================

import ../platform
import ../features/vk10
import VK_KHR_swapchain


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
    sType*: StructureType
    pNext*: pointer
    swapchainCount*: uint32
    pTimes*: ptr PresentTimeGOOGLE
  PresentTimeGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64

var # commands
  getRefreshCycleDurationGOOGLECage: proc(device: Device; swapchain: SwapchainKHR; pDisplayTimingProperties: ptr RefreshCycleDurationGOOGLE;): Result {.cdecl.}
  getPastPresentationTimingGOOGLECage: proc(device: Device; swapchain: SwapchainKHR; pPresentationTimingCount: ptr uint32; pPresentationTimings: ptr PastPresentationTimingGOOGLE;): Result {.cdecl.}
proc getRefreshCycleDurationGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pDisplayTimingProperties: ptr RefreshCycleDurationGOOGLE;
    ): Result {.cdecl, discardable.} =
  getRefreshCycleDurationGOOGLECage(device,swapchain,pDisplayTimingProperties)
proc getPastPresentationTimingGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pPresentationTimingCount: ptr uint32;
      pPresentationTimings: ptr PastPresentationTimingGOOGLE;
    ): Result {.cdecl, discardable.} =
  getPastPresentationTimingGOOGLECage(device,swapchain,pPresentationTimingCount,pPresentationTimings)
proc loadVK_GOOGLE_display_timing*(instance: Instance) =
  instance.defineLoader(`<<`)

  getRefreshCycleDurationGOOGLECage << "vkGetRefreshCycleDurationGOOGLE"
  getPastPresentationTimingGOOGLECage << "vkGetPastPresentationTimingGOOGLE"