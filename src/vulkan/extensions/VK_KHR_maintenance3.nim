# Generated at 2021-08-28T00:52:26Z
# VK_KHR_maintenance3
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrMaintenance3SpecVersion* = 1
  KhrMaintenance3ExtensionName* = "VK_KHR_maintenance3"

type
  PhysicalDeviceMaintenance3PropertiesKHR* = object
  DescriptorSetLayoutSupportKHR* = object

var # commands
  
const getDescriptorSetLayoutSupportKHR* = getDescriptorSetLayoutSupport
StructureType.defineAliases:
  PhysicalDeviceMaintenance3Properties as PhysicalDeviceMaintenance3PropertiesKhr
  DescriptorSetLayoutSupport as DescriptorSetLayoutSupportKhr

proc loadVK_KHR_maintenance3*(instance: Instance) =
  instance.defineLoader(`<<`)

  getDescriptorSetLayoutSupportKHRCage << "vkGetDescriptorSetLayoutSupportKHR"