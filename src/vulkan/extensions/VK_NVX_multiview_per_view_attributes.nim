# Generated at 2021-08-30T14:31:10Z
# VK_NVX_multiview_per_view_attributes


import ../platform
import ../features/vk10
import ./VK_KHR_multiview

const
  NvxMultiviewPerViewAttributesSpecVersion* = 1
  NvxMultiviewPerViewAttributesExtensionName* = "VK_NVX_multiview_per_view_attributes"

type
  PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX* = object
    sType*: StructureType
    pNext*: pointer
    perViewPositionAllComponents*: Bool32


