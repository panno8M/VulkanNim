# VK_KHR_variable_pointers

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_storage_buffer_storage_class
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrVariablePointersSpecVersion* = 1
  KhrVariablePointersExtensionName* = "VK_KHR_variable_pointers"

type
  PhysicalDeviceVariablePointerFeaturesKHR* = object
  PhysicalDeviceVariablePointersFeaturesKHR* = object



