
import ../platform
import ../features/vk10
import VK_KHR_swapchain
import VK_KHR_display


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

var # commands
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