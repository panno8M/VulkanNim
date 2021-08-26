
import ../platform
import ../features/vk10


template MaxDeviceGroupSizeKhr*(): untyped =
  VkMaxDeviceGroupSize

type
  PhysicalDeviceGroupPropertiesKHR* = object
  DeviceGroupDeviceCreateInfoKHR* = object

var # commands
  
const enumeratePhysicalDeviceGroupsKHR* = enumeratePhysicalDeviceGroups
proc loadVK_KHR_device_group_creation*(instance: Instance) =
  instance.defineLoader(`<<`)

  enumeratePhysicalDeviceGroupsKHRCage << "vkEnumeratePhysicalDeviceGroupsKHR"