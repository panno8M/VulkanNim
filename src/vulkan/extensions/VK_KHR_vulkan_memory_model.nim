# Generated at 2021-08-31T00:22:53Z
# VK_KHR_vulkan_memory_model


import ../platform
import ../features/vk10
import ../features/vk12

const
  KhrVulkanMemoryModelSpecVersion* = 3
  KhrVulkanMemoryModelExtensionName* = "VK_KHR_vulkan_memory_model"

type
  PhysicalDeviceVulkanMemoryModelFeaturesKHR* = object

StructureType.defineAliases:
  physicalDeviceVulkanMemoryModelFeatures as physicalDeviceVulkanMemoryModelFeaturesKhr

