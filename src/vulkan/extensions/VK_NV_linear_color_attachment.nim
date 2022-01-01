# VK_NV_linear_color_attachment

import ../features/vk10
import ../platform
import VK_KHR_format_feature_flags2
prepareVulkanLibDef()

const
  NvLinearColorAttachmentSpecVersion* = 1
  NvLinearColorAttachmentExtensionName* = "VK_NV_linear_color_attachment"

type
  PhysicalDeviceLinearColorAttachmentFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceLinearColorAttachmentFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    linearColorAttachment*: Bool32



