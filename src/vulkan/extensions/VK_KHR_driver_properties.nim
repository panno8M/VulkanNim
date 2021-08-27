
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrDriverPropertiesSpecVersion* = 1
  KhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"
  MaxDriverNameSizeKhr* = MaxDriverNameSize
  MaxDriverInfoSizeKhr* = MaxDriverInfoSize

type
  DriverIdKHR* = UnusedEnum
  ConformanceVersionKHR* = object
  PhysicalDeviceDriverPropertiesKHR* = object


