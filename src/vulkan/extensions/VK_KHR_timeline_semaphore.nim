# Generated at 2021-08-30T22:51:47Z
# VK_KHR_timeline_semaphore


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2

const
  KhrTimelineSemaphoreSpecVersion* = 2
  KhrTimelineSemaphoreExtensionName* = "VK_KHR_timeline_semaphore"

type
  SemaphoreTypeKHR* = distinct UnusedEnum
  PhysicalDeviceTimelineSemaphoreFeaturesKHR* = object
  PhysicalDeviceTimelineSemaphorePropertiesKHR* = object
  SemaphoreTypeCreateInfoKHR* = object
  TimelineSemaphoreSubmitInfoKHR* = object
  SemaphoreWaitFlagBitsKHR* = distinct UnusedEnum
  {name}* = {Alias}
  SemaphoreWaitInfoKHR* = object
  SemaphoreSignalInfoKHR* = object

const getSemaphoreCounterValueKHR* = getSemaphoreCounterValue
const waitSemaphoresKHR* = waitSemaphores
const signalSemaphoreKHR* = signalSemaphore
SemaphoreType.defineAliases:
  binary as binaryKhr
  timeline as timelineKhr

StructureType.defineAliases:
  physicalDeviceTimelineSemaphoreFeatures as physicalDeviceTimelineSemaphoreFeaturesKhr
  physicalDeviceTimelineSemaphoreProperties as physicalDeviceTimelineSemaphorePropertiesKhr
  semaphoreTypeCreateInfo as semaphoreTypeCreateInfoKhr
  timelineSemaphoreSubmitInfo as timelineSemaphoreSubmitInfoKhr
  semaphoreWaitInfo as semaphoreWaitInfoKhr
  semaphoreSignalInfo as semaphoreSignalInfoKhr

SemaphoreWaitFlagBits.defineAliases:
  any as anyKhr

