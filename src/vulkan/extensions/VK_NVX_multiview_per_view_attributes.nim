# Generated at 2021-09-09T01:49:36Z
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
    sType*: StructureType
    pNext*: pointer
    perViewPositionAllComponents*: Bool32



