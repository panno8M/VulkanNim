# Generated at 2021-08-27T06:01:03Z
# VK_KHR_timeline_semaphore
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrTimelineSemaphoreSpecVersion* = 2
  KhrTimelineSemaphoreExtensionName* = "VK_KHR_timeline_semaphore"

type
  SemaphoreTypeKHR* = UnusedEnum
  PhysicalDeviceTimelineSemaphoreFeaturesKHR* = object
  PhysicalDeviceTimelineSemaphorePropertiesKHR* = object
  SemaphoreTypeCreateInfoKHR* = object
  TimelineSemaphoreSubmitInfoKHR* = object
  SemaphoreWaitFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  SemaphoreWaitInfoKHR* = object
  SemaphoreSignalInfoKHR* = object

var # commands
  
  
  
const getSemaphoreCounterValueKHR* = getSemaphoreCounterValue
const waitSemaphoresKHR* = waitSemaphores
const signalSemaphoreKHR* = signalSemaphore
proc loadVK_KHR_timeline_semaphore*(instance: Instance) =
  instance.defineLoader(`<<`)

  getSemaphoreCounterValueKHRCage << "vkGetSemaphoreCounterValueKHR"
  waitSemaphoresKHRCage << "vkWaitSemaphoresKHR"
  signalSemaphoreKHRCage << "vkSignalSemaphoreKHR"