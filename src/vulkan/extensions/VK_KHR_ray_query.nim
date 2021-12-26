# Generated at 2021-12-26T16:57:02Z
# VK_KHR_ray_query

import ../platform

import ../features/vk10
import ./VK_KHR_spirv_1_4
import ./VK_KHR_acceleration_structure
export VK_KHR_spirv_1_4
export VK_KHR_acceleration_structure
prepareVulkanLibDef()

const
  KhrRayQuerySpecVersion* = 1
  KhrRayQueryExtensionName* = "VK_KHR_ray_query"

type
  PhysicalDeviceRayQueryFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceRayQueryFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    rayQuery*: Bool32



