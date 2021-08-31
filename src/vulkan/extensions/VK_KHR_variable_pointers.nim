# Generated at 2021-08-31T00:22:53Z
# VK_KHR_variable_pointers


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_storage_buffer_storage_class
import ../features/vk11
export VK_KHR_get_physical_device_properties2
export VK_KHR_storage_buffer_storage_class

const
  KhrVariablePointersSpecVersion* = 1
  KhrVariablePointersExtensionName* = "VK_KHR_variable_pointers"

type
  PhysicalDeviceVariablePointerFeaturesKHR* = object
  PhysicalDeviceVariablePointersFeaturesKHR* = object

StructureType.defineAliases:
  physicalDeviceVariablePointersFeatures as physicalDeviceVariablePointersFeaturesKhr
  physicalDeviceVariablePointersFeaturesKhr as physicalDeviceVariablePointerFeaturesKhr

