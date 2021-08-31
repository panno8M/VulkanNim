# Generated at 2021-08-31T05:19:03Z
# VK_KHR_shared_presentable_image


import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_get_surface_capabilities2
export VK_KHR_swapchain
export VK_KHR_get_physical_device_properties2
export VK_KHR_get_surface_capabilities2

const
  KhrSharedPresentableImageSpecVersion* = 1
  KhrSharedPresentableImageExtensionName* = "VK_KHR_shared_presentable_image"

type
  SharedPresentSurfaceCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    sharedPresentSupportedUsageFlags*: ImageUsageFlags

var # command cages
  getSwapchainStatusKHRCage: proc(device: Device; swapchain: SwapchainKHR;): Result {.cdecl.}
proc getSwapchainStatusKHR*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl, discardable.} =
  getSwapchainStatusKHRCage(device,swapchain)

proc loadVK_KHR_shared_presentable_image*(instance: Instance) =
  instance.defineLoader(`<<`)

  getSwapchainStatusKHRCage << "vkGetSwapchainStatusKHR"