# VK_KHR_zero_initialize_workgroup_memory

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  KhrZeroInitializeWorkgroupMemorySpecVersion* = 1
  KhrZeroInitializeWorkgroupMemoryExtensionName* = "VK_KHR_zero_initialize_workgroup_memory"

type
  PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceZeroInitializeWorkgroupMemoryFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderZeroInitializeWorkgroupMemory*: Bool32



