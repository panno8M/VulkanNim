
import ../platform
import ../features/vk10


const
  KhrDeviceGroupCreationSpecVersion* = 1
  KhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"
  MaxDeviceGroupSizeKhr* = MaxDeviceGroupSize

type
  PhysicalDeviceGroupPropertiesKHR* = object
  DeviceGroupDeviceCreateInfoKHR* = object

var # commands
  
const enumeratePhysicalDeviceGroupsKHR* = enumeratePhysicalDeviceGroups
proc loadVK_KHR_device_group_creation*(instance: Instance) =
  instance.defineLoader(`<<`)

  enumeratePhysicalDeviceGroupsKHRCage << "vkEnumeratePhysicalDeviceGroupsKHR"