# VK_KHR_timeline_semaphore

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  KhrTimelineSemaphoreSpecVersion* = 2
  KhrTimelineSemaphoreExtensionName* = "VK_KHR_timeline_semaphore"

type
  PhysicalDeviceTimelineSemaphoreFeaturesKHR* = object
  PhysicalDeviceTimelineSemaphorePropertiesKHR* = object
  SemaphoreTypeCreateInfoKHR* = object
  TimelineSemaphoreSubmitInfoKHR* = object
  SemaphoreWaitInfoKHR* = object
  SemaphoreSignalInfoKHR* = object

const getSemaphoreCounterValueKHR* = getSemaphoreCounterValue
const waitSemaphoresKHR* = waitSemaphores
const signalSemaphoreKHR* = signalSemaphore

