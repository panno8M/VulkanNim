# Generated at 2021-12-26T10:16:14Z
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



