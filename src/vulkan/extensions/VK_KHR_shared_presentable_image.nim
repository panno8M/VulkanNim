# Generated at 2021-12-26T10:16:14Z
# VK_KHR_shared_presentable_image

import ../platform

import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_get_surface_capabilities2
export VK_KHR_swapchain
export VK_KHR_get_physical_device_properties2
export VK_KHR_get_surface_capabilities2

prepareVulkanLibDef()

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
    ): Result {.cdecl,
      successCodes(success, suboptimalKhr),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost, errorOutOfDateKhr, errorSurfaceLostKhr, errorFullScreenExclusiveModeLostExt),
      lazyload("vkGetSwapchainStatusKHR", DeviceLevel).}

proc loadAllVK_KHR_shared_presentable_image*(instance: Instance) =
  instance.loadCommand getSwapchainStatusKHR

proc loadVK_KHR_shared_presentable_image*(device: Device) =
  device.loadCommand getSwapchainStatusKHR

