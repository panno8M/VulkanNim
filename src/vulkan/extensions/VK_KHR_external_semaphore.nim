# Generated at 2021-12-25T07:50:19Z
# VK_KHR_external_semaphore

import ../platform
import ../features/vk10
import ./VK_KHR_external_semaphore_capabilities
import ../features/vk11
export VK_KHR_external_semaphore_capabilities

prepareVulkanLibDef()

const
  KhrExternalSemaphoreSpecVersion* = 1
  KhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

type
  ExportSemaphoreCreateInfoKHR* = object



