# VK_KHR_display_swapchain

import ../features/vk10
import VK_KHR_swapchain
import VK_KHR_display
import ../platform
prepareVulkanLibDef()

const
  KhrDisplaySwapchainSpecVersion* = 10
  KhrDisplaySwapchainExtensionName* = "VK_KHR_display_swapchain"

type
  DisplayPresentInfoKHR* = object
    sType* {.constant: (StructureType.displayPresentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    srcRect*: Rect2D
    dstRect*: Rect2D
    persistent*: Bool32

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

proc loadAllVK_KHR_display_swapchain*(instance: Instance) = instance.loadCommands:
  createSharedSwapchainsKHR
proc loadVK_KHR_display_swapchain*(device: Device) = device.loadCommands:
  createSharedSwapchainsKHR
