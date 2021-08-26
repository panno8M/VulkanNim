
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


template LuidSizeKhr*(): untyped =
  VkLuidSize

type
  {name}* = {Alias}
  ExternalFenceHandleTypeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  ExternalFenceFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceExternalFenceInfoKHR* = object
  ExternalFencePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

var # commands
  
const getPhysicalDeviceExternalFencePropertiesKHR* = getPhysicalDeviceExternalFenceProperties
proc loadVK_KHR_external_fence_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalFencePropertiesKHRCage << "vkGetPhysicalDeviceExternalFencePropertiesKHR"