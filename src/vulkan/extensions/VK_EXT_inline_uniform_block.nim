
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_maintenance1




type
  PhysicalDeviceInlineUniformBlockFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    inlineUniformBlock*: Bool32
    descriptorBindingInlineUniformBlockUpdateAfterBind*: Bool32
  PhysicalDeviceInlineUniformBlockPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxInlineUniformBlockSize*: uint32
    maxPerStageDescriptorInlineUniformBlocks*: uint32
    maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks*: uint32
    maxDescriptorSetInlineUniformBlocks*: uint32
    maxDescriptorSetUpdateAfterBindInlineUniformBlocks*: uint32
  WriteDescriptorSetInlineUniformBlockEXT* = object
    sType*: StructureType
    pNext*: pointer
    dataSize*: uint32
    pData*: pointer
  DescriptorPoolInlineUniformBlockCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxInlineUniformBlockBindings*: uint32


