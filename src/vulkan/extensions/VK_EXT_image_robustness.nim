# Generated at 2021-09-09T01:49:36Z
# VK_EXT_image_robustness


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtImageRobustnessSpecVersion* = 1
  ExtImageRobustnessExtensionName* = "VK_EXT_image_robustness"

type
  PhysicalDeviceImageRobustnessFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    robustImageAccess*: Bool32



