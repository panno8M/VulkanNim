# Generated at 2021-08-30T14:31:10Z
# VK_KHR_variable_pointers


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_storage_buffer_storage_class

const
  KhrVariablePointersSpecVersion* = 1
  KhrVariablePointersExtensionName* = "VK_KHR_variable_pointers"

type
  PhysicalDeviceVariablePointerFeaturesKHR* = object
  PhysicalDeviceVariablePointersFeaturesKHR* = object

StructureType.defineAliases:
  physicalDeviceVariablePointersFeatures as physicalDeviceVariablePointersFeaturesKhr
  physicalDeviceVariablePointersFeaturesKhr as physicalDeviceVariablePointerFeaturesKhr

