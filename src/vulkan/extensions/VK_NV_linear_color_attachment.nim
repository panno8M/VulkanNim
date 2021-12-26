# Generated at 2021-12-26T16:57:01Z
# VK_NV_linear_color_attachment

import ../platform

import ../features/vk10
import ./VK_KHR_format_feature_flags2
export VK_KHR_format_feature_flags2
prepareVulkanLibDef()

const
  NvLinearColorAttachmentSpecVersion* = 1
  NvLinearColorAttachmentExtensionName* = "VK_NV_linear_color_attachment"

type
  PhysicalDeviceLinearColorAttachmentFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceLinearColorAttachmentFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    linearColorAttachment*: Bool32



