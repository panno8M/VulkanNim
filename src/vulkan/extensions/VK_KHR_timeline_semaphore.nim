# Generated at 2021-08-28T00:52:26Z
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
SemaphoreType.defineAliases:
  Binary as BinaryKhr
  Timeline as TimelineKhr

StructureType.defineAliases:
  PhysicalDeviceTimelineSemaphoreFeatures as PhysicalDeviceTimelineSemaphoreFeaturesKhr
  PhysicalDeviceTimelineSemaphoreProperties as PhysicalDeviceTimelineSemaphorePropertiesKhr
  SemaphoreTypeCreateInfo as SemaphoreTypeCreateInfoKhr
  TimelineSemaphoreSubmitInfo as TimelineSemaphoreSubmitInfoKhr
  SemaphoreWaitInfo as SemaphoreWaitInfoKhr
  SemaphoreSignalInfo as SemaphoreSignalInfoKhr

SemaphoreWaitFlagBits.defineAliases:
  Any as AnyBitKhr

proc loadVK_KHR_timeline_semaphore*(instance: Instance) =
  instance.defineLoader(`<<`)

  getSemaphoreCounterValueKHRCage << "vkGetSemaphoreCounterValueKHR"
  waitSemaphoresKHRCage << "vkWaitSemaphoresKHR"
  signalSemaphoreKHRCage << "vkSignalSemaphoreKHR"