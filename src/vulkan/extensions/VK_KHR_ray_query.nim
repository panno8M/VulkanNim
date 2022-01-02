# VK_KHR_ray_query

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrRayQuerySpecVersion* = 1
  KhrRayQueryExtensionName* = "VK_KHR_ray_query"

type
  PhysicalDeviceRayQueryFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceRayQueryFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    rayQuery*: Bool32



