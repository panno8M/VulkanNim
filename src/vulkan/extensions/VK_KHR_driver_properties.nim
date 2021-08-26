
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


template MaxDriverNameSizeKhr*(): untyped =
  VkMaxDriverNameSize
template MaxDriverInfoSizeKhr*(): untyped =
  VkMaxDriverInfoSize

type
  DriverIdKHR* = UnusedEnum
  ConformanceVersionKHR* = object
  PhysicalDeviceDriverPropertiesKHR* = object


