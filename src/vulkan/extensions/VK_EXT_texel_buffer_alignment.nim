# VK_EXT_texel_buffer_alignment

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtTexelBufferAlignmentSpecVersion* = 1
  ExtTexelBufferAlignmentExtensionName* = "VK_EXT_texel_buffer_alignment"

type
  PhysicalDeviceTexelBufferAlignmentFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceTexelBufferAlignmentFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    texelBufferAlignment*: Bool32
  PhysicalDeviceTexelBufferAlignmentPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceTexelBufferAlignmentPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    storageTexelBufferOffsetAlignmentBytes*: DeviceSize
    storageTexelBufferOffsetSingleTexelAlignment*: Bool32
    uniformTexelBufferOffsetAlignmentBytes*: DeviceSize
    uniformTexelBufferOffsetSingleTexelAlignment*: Bool32



