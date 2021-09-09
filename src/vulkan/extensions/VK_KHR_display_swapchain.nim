# Generated at 2021-09-09T01:49:36Z
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
    sType*: StructureType
    pNext*: pointer
    srcRect*: Rect2D
    dstRect*: Rect2D
    persistent*: Bool32

proc createSharedSwapchainsKHR*(
      device: Device;
      swapchainCount: uint32;
      pCreateInfos: ptr SwapchainCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSwapchains: ptr SwapchainKHR;
    ): Result {.cdecl, lazyload("vkCreateSharedSwapchainsKHR", DeviceLevel).}

proc loadAllVK_KHR_display_swapchain*(instance: Instance) =
  createSharedSwapchainsKHR.smartLoad(instance)

proc loadVK_KHR_display_swapchain*(device: Device) =
  createSharedSwapchainsKHR.smartLoad(device)

