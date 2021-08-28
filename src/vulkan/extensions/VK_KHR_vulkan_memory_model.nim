# Generated at 2021-08-28T00:52:26Z
# VK_KHR_vulkan_memory_model
# =================================

import ../platform
import ../features/vk10


const
  KhrVulkanMemoryModelSpecVersion* = 3
  KhrVulkanMemoryModelExtensionName* = "VK_KHR_vulkan_memory_model"

type
  PhysicalDeviceVulkanMemoryModelFeaturesKHR* = object

StructureType.defineAliases:
  PhysicalDeviceVulkanMemoryModelFeatures as PhysicalDeviceVulkanMemoryModelFeaturesKhr

