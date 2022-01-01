# VK_KHR_shared_presentable_image

import ../features/vk10
import VK_KHR_swapchain
import VK_KHR_get_physical_device_properties2
import VK_KHR_get_surface_capabilities2
import ../platform
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
      successCodes: @[Result.success, Result.suboptimalKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost, Result.errorOutOfDateKhr, Result.errorSurfaceLostKhr, Result.errorFullScreenExclusiveModeLostExt],
      lazyload("vkGetSwapchainStatusKHR", DeviceLevel).}

proc loadAllVK_KHR_shared_presentable_image*(instance: Instance) = instance.loadCommands:
  getSwapchainStatusKHR
proc loadVK_KHR_shared_presentable_image*(device: Device) = device.loadCommands:
  getSwapchainStatusKHR
