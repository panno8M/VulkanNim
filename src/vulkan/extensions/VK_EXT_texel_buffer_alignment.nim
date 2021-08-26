
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




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


