# VK_KHR_external_fence

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrExternalFenceSpecVersion* = 1
  KhrExternalFenceExtensionName* = "VK_KHR_external_fence"

type
  ExportFenceCreateInfoKHR* = object



