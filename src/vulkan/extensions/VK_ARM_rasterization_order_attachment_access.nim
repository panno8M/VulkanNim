# Generated at 2021-12-26T16:57:02Z
# VK_ARM_rasterization_order_attachment_access

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
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



