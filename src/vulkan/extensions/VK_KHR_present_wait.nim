# VK_KHR_present_wait

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrPresentWaitSpecVersion* = 1
  KhrPresentWaitExtensionName* = "VK_KHR_present_wait"

type
  PhysicalDevicePresentWaitFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDevicePresentWaitFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    presentWait*: Bool32

proc waitForPresentKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      presentId: uint64;
      timeout: uint64;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.timeout],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      lazyload("vkWaitForPresentKHR", DeviceLevel).}

proc loadAllVK_KHR_present_wait*(instance: Instance) = instance.loadCommands:
  waitForPresentKHR
proc loadVK_KHR_present_wait*(device: Device) = device.loadCommands:
  waitForPresentKHR
