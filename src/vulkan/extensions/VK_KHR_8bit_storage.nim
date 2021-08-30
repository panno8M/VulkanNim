# Generated at 2021-08-30T14:31:10Z
# VK_KHR_8bit_storage


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_storage_buffer_storage_class

const
  Khr8bitStorageSpecVersion* = 1
  Khr8bitStorageExtensionName* = "VK_KHR_8bit_storage"

type
  PhysicalDevice8BitStorageFeaturesKHR* = object

StructureType.defineAliases:
  physicalDevice8bitStorageFeatures as physicalDevice8bitStorageFeaturesKhr

