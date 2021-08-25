
import ../platform
import ../features/vk10
import VK_KHR_swapchain


type
  PresentTimeGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64
  PresentTimesInfoGOOGLE* = object
    sType*: StructureType
    pNext*: pointer
    swapchainCount*: uint32
    pTimes*: ptr PresentTimeGOOGLE
  PastPresentationTimingGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64
    actualPresentTime*: uint64
    earliestPresentTime*: uint64
    presentMargin*: uint64
  RefreshCycleDurationGOOGLE* = object
    refreshDuration*: uint64

const GoogleDisplayTimingExtensionName* = "VK_GOOGLE_display_timing"
const GoogleDisplayTimingSpecVersion* = 1
var # commands
  getPastPresentationTimingGOOGLECage: proc(device: Device; swapchain: SwapchainKHR; pPresentationTimingCount: ptr uint32; pPresentationTimings: ptr PastPresentationTimingGOOGLE;): Result {.cdecl.}
  getRefreshCycleDurationGOOGLECage: proc(device: Device; swapchain: SwapchainKHR; pDisplayTimingProperties: ptr RefreshCycleDurationGOOGLE;): Result {.cdecl.}

proc getPastPresentationTimingGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pPresentationTimingCount: ptr uint32;
      pPresentationTimings: ptr PastPresentationTimingGOOGLE;
    ): Result {.cdecl, discardable.} =
  getPastPresentationTimingGOOGLECage(device,swapchain,pPresentationTimingCount,pPresentationTimings)

proc getRefreshCycleDurationGOOGLE*(
      device: Device;
      swapchain: SwapchainKHR;
      pDisplayTimingProperties: ptr RefreshCycleDurationGOOGLE;
    ): Result {.cdecl, discardable.} =
  getRefreshCycleDurationGOOGLECage(device,swapchain,pDisplayTimingProperties)


proc loadVK_GOOGLE_display_timing*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPastPresentationTimingGOOGLECage << "vkGetPastPresentationTimingGOOGLE"
  getRefreshCycleDurationGOOGLECage << "vkGetRefreshCycleDurationGOOGLE"