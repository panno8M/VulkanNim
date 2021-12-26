# Generated at 2021-12-26T10:42:47Z
# VK_NVX_multiview_per_view_attributes

import ../platform

import ../features/vk10
import ./VK_KHR_multiview
export VK_KHR_multiview
prepareVulkanLibDef()

const
  NvxMultiviewPerViewAttributesSpecVersion* = 1
  NvxMultiviewPerViewAttributesExtensionName* = "VK_NVX_multiview_per_view_attributes"

type
  PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX* = object
    sType* {.constant: (StructureType.physicalDeviceMultiviewPerViewAttributesPropertiesNvx).}: StructureType
    pNext* {.optional.}: pointer
    perViewPositionAllComponents*: Bool32



