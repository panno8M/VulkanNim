# Generated at 2021-08-28T12:28:00Z
# VK_EXT_inline_uniform_block
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_maintenance1


const
  ExtInlineUniformBlockSpecVersion* = 1
  ExtInlineUniformBlockExtensionName* = "VK_EXT_inline_uniform_block"

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



