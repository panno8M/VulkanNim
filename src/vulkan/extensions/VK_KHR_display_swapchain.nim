# Generated at 2021-12-25T07:50:19Z
# VK_KHR_display_swapchain

import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_KHR_surface
export VK_KHR_swapchain
export VK_KHR_surface

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
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorIncompatibleDisplayKhr, errorDeviceLost, errorSurfaceLostKhr),
      lazyload("vkCreateSharedSwapchainsKHR", DeviceLevel).}

proc loadAllVK_KHR_display_swapchain*(instance: Instance) =
  instance.loadCommand createSharedSwapchainsKHR

proc loadVK_KHR_display_swapchain*(device: Device) =
  device.loadCommand createSharedSwapchainsKHR

