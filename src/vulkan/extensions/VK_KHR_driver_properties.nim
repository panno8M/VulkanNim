
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  DriverIdKHR* = UnusedEnum
  PhysicalDeviceDriverPropertiesKHR* = object
  ConformanceVersionKHR* = object

template MaxDriverInfoSizeKhr*(): untyped =
  VkMaxDriverInfoSize
template MaxDriverNameSizeKhr*(): untyped =
  VkMaxDriverNameSize
const KhrDriverPropertiesSpecVersion* = 1
const KhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"

