# Generated at 2021-09-09T01:49:36Z
# VK_EXT_texel_buffer_alignment


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtTexelBufferAlignmentSpecVersion* = 1
  ExtTexelBufferAlignmentExtensionName* = "VK_EXT_texel_buffer_alignment"

type
  PhysicalDeviceTexelBufferAlignmentFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    texelBufferAlignment*: Bool32
  PhysicalDeviceTexelBufferAlignmentPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    storageTexelBufferOffsetAlignmentBytes*: DeviceSize
    storageTexelBufferOffsetSingleTexelAlignment*: Bool32
    uniformTexelBufferOffsetAlignmentBytes*: DeviceSize
    uniformTexelBufferOffsetSingleTexelAlignment*: Bool32



