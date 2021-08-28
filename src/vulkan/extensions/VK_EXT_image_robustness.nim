# Generated at 2021-08-28T12:28:01Z
# VK_EXT_image_robustness
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtImageRobustnessSpecVersion* = 1
  ExtImageRobustnessExtensionName* = "VK_EXT_image_robustness"

type
  PhysicalDeviceImageRobustnessFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    robustImageAccess*: Bool32



