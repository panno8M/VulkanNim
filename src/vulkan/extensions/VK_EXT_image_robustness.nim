# Generated at 2021-09-10T05:27:58Z
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
    sType* {.constant: (StructureType.physicalDeviceImageRobustnessFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    robustImageAccess*: Bool32



