# Generated at 2021-09-12T04:58:24Z
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
    sType* {.constant: (StructureType.sharedPresentSurfaceCapabilitiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    sharedPresentSupportedUsageFlags* {.optional.}: ImageUsageFlags

proc getSwapchainStatusKHR*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl, lazyload("vkGetSwapchainStatusKHR", DeviceLevel).}

proc loadAllVK_KHR_shared_presentable_image*(instance: Instance) =
  getSwapchainStatusKHR.load(instance)

proc loadVK_KHR_shared_presentable_image*(device: Device) =
  getSwapchainStatusKHR.load(device)

