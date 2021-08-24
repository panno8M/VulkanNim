
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  SemaphoreWaitFlagBitsKHR* = UnusedEnum
  SemaphoreSignalInfoKHR* = object
  TimelineSemaphoreSubmitInfoKHR* = object
  {name}* = {Alias}
  SemaphoreTypeCreateInfoKHR* = object
  SemaphoreTypeKHR* = UnusedEnum
  SemaphoreWaitInfoKHR* = object
  PhysicalDeviceTimelineSemaphoreFeaturesKHR* = object
  PhysicalDeviceTimelineSemaphorePropertiesKHR* = object

const KhrTimelineSemaphoreSpecVersion* = 2
const KhrTimelineSemaphoreExtensionName* = "VK_KHR_timeline_semaphore"
var # commands
  
  
  

const getSemaphoreCounterValueKHR* = getSemaphoreCounterValue

const waitSemaphoresKHR* = waitSemaphores

const signalSemaphoreKHR* = signalSemaphore


proc loadVK_KHR_timeline_semaphore*(instance: Instance) =
  instance.defineLoader(`<<`)

  getSemaphoreCounterValueKHRCage << "vkGetSemaphoreCounterValueKHR"
  waitSemaphoresKHRCage << "vkWaitSemaphoresKHR"
  signalSemaphoreKHRCage << "vkSignalSemaphoreKHR"