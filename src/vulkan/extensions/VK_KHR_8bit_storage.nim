# Generated at 2021-08-28T00:52:26Z
# VK_KHR_8bit_storage
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_storage_buffer_storage_class


const
  Khr8bitStorageSpecVersion* = 1
  Khr8bitStorageExtensionName* = "VK_KHR_8bit_storage"

type
  PhysicalDevice8BitStorageFeaturesKHR* = object

StructureType.defineAliases:
  PhysicalDevice8bitStorageFeatures as PhysicalDevice8bitStorageFeaturesKhr

