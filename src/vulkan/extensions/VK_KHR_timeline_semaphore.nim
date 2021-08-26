
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




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