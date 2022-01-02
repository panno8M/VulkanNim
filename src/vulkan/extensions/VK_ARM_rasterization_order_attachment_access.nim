# VK_ARM_rasterization_order_attachment_access

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ArmRasterizationOrderAttachmentAccessSpecVersion* = 1
  ArmRasterizationOrderAttachmentAccessExtensionName* = "VK_ARM_rasterization_order_attachment_access"

type
  PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM* = object
    sType* {.constant: (StructureType.physicalDeviceRasterizationOrderAttachmentAccessFeaturesArm).}: StructureType
    pNext* {.optional.}: pointer
    rasterizationOrderColorAttachmentAccess*: Bool32
    rasterizationOrderDepthAttachmentAccess*: Bool32
    rasterizationOrderStencilAttachmentAccess*: Bool32



