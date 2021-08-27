
import ../platform
import ../features/vk10
import VK_KHR_swapchain
import VK_KHR_get_physical_device_properties2
import VK_KHR_get_surface_capabilities2


const
  KhrSharedPresentableImageSpecVersion* = 1
  KhrSharedPresentableImageExtensionName* = "VK_KHR_shared_presentable_image"

type
  SharedPresentSurfaceCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    sharedPresentSupportedUsageFlags*: ImageUsageFlags

var # commands
  getSwapchainStatusKHRCage: proc(device: Device; swapchain: SwapchainKHR;): Result {.cdecl.}
proc getSwapchainStatusKHR*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl, discardable.} =
  getSwapchainStatusKHRCage(device,swapchain)
proc loadVK_KHR_shared_presentable_image*(instance: Instance) =
  instance.defineLoader(`<<`)

  getSwapchainStatusKHRCage << "vkGetSwapchainStatusKHR"