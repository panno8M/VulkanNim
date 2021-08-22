
import ../platform
import ../features/vk10


type
  PhysicalDeviceGroupPropertiesKHR* = object
  DeviceGroupDeviceCreateInfoKHR* = object

const KhrDeviceGroupCreationSpecVersion* = 1
const KhrDeviceGroupCreationExtensionName* = "VK_KHR_device_group_creation"
template MaxDeviceGroupSizeKhr*(): untyped =
  VkMaxDeviceGroupSize
var # commands
  

const enumeratePhysicalDeviceGroupsKHR* = enumeratePhysicalDeviceGroups


proc loadVK_KHR_device_group_creation*(instance: Instance) =
  instance.defineLoader(`<<`)

  enumeratePhysicalDeviceGroupsKHRCage << "vkEnumeratePhysicalDeviceGroupsKHR"