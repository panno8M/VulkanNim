
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  ExternalSemaphoreFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceIDPropertiesKHR* = object
  {name}* = {Alias}
  ExternalSemaphoreHandleTypeFlagBitsKHR* = UnusedEnum
  ExternalSemaphorePropertiesKHR* = object
  PhysicalDeviceExternalSemaphoreInfoKHR* = object
  {name}* = {Alias}

const KhrExternalSemaphoreCapabilitiesSpecVersion* = 1
template LuidSizeKhr*(): untyped =
  VkLuidSize
const KhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"
var # commands
  

const getPhysicalDeviceExternalSemaphorePropertiesKHR* = getPhysicalDeviceExternalSemaphoreProperties


proc loadVK_KHR_external_semaphore_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalSemaphorePropertiesKHRCage << "vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"