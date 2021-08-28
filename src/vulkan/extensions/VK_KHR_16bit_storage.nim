# Generated at 2021-08-28T00:52:26Z
# VK_KHR_16bit_storage
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_storage_buffer_storage_class


const
  Khr16bitStorageSpecVersion* = 1
  Khr16bitStorageExtensionName* = "VK_KHR_16bit_storage"

type
  PhysicalDevice16BitStorageFeaturesKHR* = object

StructureType.defineAliases:
  PhysicalDevice16bitStorageFeatures as PhysicalDevice16bitStorageFeaturesKhr

