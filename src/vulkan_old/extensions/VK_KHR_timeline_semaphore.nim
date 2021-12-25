# Generated at 2021-12-22T14:43:49Z
# VK_KHR_timeline_semaphore

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrTimelineSemaphoreSpecVersion* = 2
  KhrTimelineSemaphoreExtensionName* = "VK_KHR_timeline_semaphore"

type # enums and bitmasks
  SemaphoreTypeKHR* = distinct UnusedEnum
  SemaphoreWaitFlagBitsKHR* = distinct UnusedEnum
  SemaphoreWaitFlagsKHR* = SemaphoreWaitFlags

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


