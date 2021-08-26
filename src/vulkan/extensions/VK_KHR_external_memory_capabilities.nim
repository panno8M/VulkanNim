
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


template LuidSizeKhr*(): untyped =
  VkLuidSize

type
  {name}* = {Alias}
  ExternalMemoryHandleTypeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  ExternalMemoryFeatureFlagBitsKHR* = UnusedEnum
  ExternalMemoryPropertiesKHR* = object
  PhysicalDeviceExternalImageFormatInfoKHR* = object
  ExternalImageFormatPropertiesKHR* = object
  PhysicalDeviceExternalBufferInfoKHR* = object
  ExternalBufferPropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

var # commands
  
const getPhysicalDeviceExternalBufferPropertiesKHR* = getPhysicalDeviceExternalBufferProperties
proc loadVK_KHR_external_memory_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalBufferPropertiesKHRCage << "vkGetPhysicalDeviceExternalBufferPropertiesKHR"