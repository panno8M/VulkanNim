
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrExternalSemaphoreCapabilitiesSpecVersion* = 1
  KhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"
  LuidSizeKhr* = LuidSize

type
  {name}* = {Alias}
  ExternalSemaphoreHandleTypeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  ExternalSemaphoreFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceExternalSemaphoreInfoKHR* = object
  ExternalSemaphorePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

var # commands
  
const getPhysicalDeviceExternalSemaphorePropertiesKHR* = getPhysicalDeviceExternalSemaphoreProperties
proc loadVK_KHR_external_semaphore_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalSemaphorePropertiesKHRCage << "vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"