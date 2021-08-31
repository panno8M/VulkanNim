# Generated at 2021-08-31T05:19:03Z
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

var # command cages
  createSharedSwapchainsKHRCage: proc(device: Device; swapchainCount: uint32; pCreateInfos: ptr SwapchainCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSwapchains: ptr SwapchainKHR;): Result {.cdecl.}
proc createSharedSwapchainsKHR*(
      device: Device;
      swapchainCount: uint32;
      pCreateInfos: ptr SwapchainCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSwapchains: ptr SwapchainKHR;
    ): Result {.cdecl, discardable.} =
  createSharedSwapchainsKHRCage(device,swapchainCount,pCreateInfos,pAllocator,pSwapchains)

proc loadVK_KHR_display_swapchain*(instance: Instance) =
  instance.defineLoader(`<<`)

  createSharedSwapchainsKHRCage << "vkCreateSharedSwapchainsKHR"