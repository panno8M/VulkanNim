# Generated at 2021-12-26T16:57:02Z
# VK_KHR_workgroup_memory_explicit_layout

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  KhrWorkgroupMemoryExplicitLayoutSpecVersion* = 1
  KhrWorkgroupMemoryExplicitLayoutExtensionName* = "VK_KHR_workgroup_memory_explicit_layout"

type
  PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    workgroupMemoryExplicitLayout*: Bool32
    workgroupMemoryExplicitLayoutScalarBlockLayout*: Bool32
    workgroupMemoryExplicitLayout8BitAccess*: Bool32
    workgroupMemoryExplicitLayout16BitAccess*: Bool32



