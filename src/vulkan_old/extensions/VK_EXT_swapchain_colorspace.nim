# Generated at 2021-10-24T02:03:04Z
# VK_EXT_swapchain_colorspace

import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

prepareVulkanLibDef()

const
  ExtSwapchainColorSpaceSpecVersion* = 4
  ExtSwapchainColorSpaceExtensionName* = "VK_EXT_swapchain_colorspace"

ColorSpaceKHR.defineAliases:
  displayP3LinearExt as dciP3LinearExt


