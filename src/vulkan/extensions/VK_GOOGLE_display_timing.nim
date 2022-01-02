# VK_GOOGLE_display_timing

import ../features/vk10
import ../platform
prepareVulkanLibDef()

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
    pTimes* {.optional, length: swapchainCount.}: arrPtr[PresentTimeGOOGLE]
  PresentTimeGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64

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

proc loadAllVK_GOOGLE_display_timing*(instance: Instance) = instance.loadCommands:
  getRefreshCycleDurationGOOGLE
  getPastPresentationTimingGOOGLE
proc loadVK_GOOGLE_display_timing*(device: Device) = device.loadCommands:
  getRefreshCycleDurationGOOGLE
  getPastPresentationTimingGOOGLE
