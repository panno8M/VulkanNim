# Generated at 2021-10-02T09:29:45Z
# VK_KHR_display_swapchain


import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_KHR_surface
export VK_KHR_swapchain
export VK_KHR_surface

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
  createSharedSwapchainsKHR.load(instance)

proc loadVK_KHR_display_swapchain*(device: Device) =
  createSharedSwapchainsKHR.load(device)

