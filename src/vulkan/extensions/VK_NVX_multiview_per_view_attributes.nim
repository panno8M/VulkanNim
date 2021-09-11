# Generated at 2021-09-10T05:27:58Z
# VK_NVX_multiview_per_view_attributes


import ../platform
import ../features/vk10
import ./VK_KHR_multiview
export VK_KHR_multiview

const
  NvxMultiviewPerViewAttributesSpecVersion* = 1
  NvxMultiviewPerViewAttributesExtensionName* = "VK_NVX_multiview_per_view_attributes"

type
  PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX* = object
    sType* {.constant: (StructureType.physicalDeviceMultiviewPerViewAttributesPropertiesNvx).}: StructureType
    pNext* {.optional.}: pointer
    perViewPositionAllComponents*: Bool32



