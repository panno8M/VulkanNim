# VK_EXT_image_robustness

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  ExtImageRobustnessSpecVersion* = 1
  ExtImageRobustnessExtensionName* = "VK_EXT_image_robustness"

type
  PhysicalDeviceImageRobustnessFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceImageRobustnessFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    robustImageAccess*: Bool32



