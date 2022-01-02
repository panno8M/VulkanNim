# VK_KHR_external_semaphore

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrExternalSemaphoreSpecVersion* = 1
  KhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

type
  ExportSemaphoreCreateInfoKHR* = object



