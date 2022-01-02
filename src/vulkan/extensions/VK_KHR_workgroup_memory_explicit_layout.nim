# VK_KHR_workgroup_memory_explicit_layout

import ../features/vk10
import ../platform
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



