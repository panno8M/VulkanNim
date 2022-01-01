# VK_KHR_external_fence

import ../features/vk10
import VK_KHR_external_fence_capabilities
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrExternalFenceSpecVersion* = 1
  KhrExternalFenceExtensionName* = "VK_KHR_external_fence"

type
  ExportFenceCreateInfoKHR* = object



