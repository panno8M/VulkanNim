
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PhysicalDeviceMaintenance3PropertiesKHR* = object
  DescriptorSetLayoutSupportKHR* = object

var # commands
  
const getDescriptorSetLayoutSupportKHR* = getDescriptorSetLayoutSupport
proc loadVK_KHR_maintenance3*(instance: Instance) =
  instance.defineLoader(`<<`)

  getDescriptorSetLayoutSupportKHRCage << "vkGetDescriptorSetLayoutSupportKHR"