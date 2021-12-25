# Generated at 2021-12-25T14:19:30Z
# VK_KHR_8bit_storage

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_storage_buffer_storage_class
import ../features/vk12
export VK_KHR_get_physical_device_properties2
export VK_KHR_storage_buffer_storage_class

prepareVulkanLibDef()

const
  Khr8bitStorageSpecVersion* = 1
  Khr8bitStorageExtensionName* = "VK_KHR_8bit_storage"

type
  PhysicalDevice8BitStorageFeaturesKHR* = object



