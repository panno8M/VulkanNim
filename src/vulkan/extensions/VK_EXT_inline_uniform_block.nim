# Generated at 2021-12-25T07:50:19Z
# VK_EXT_inline_uniform_block

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_maintenance1
export VK_KHR_get_physical_device_properties2
export VK_KHR_maintenance1

prepareVulkanLibDef()

const
  ExtInlineUniformBlockSpecVersion* = 1
  ExtInlineUniformBlockExtensionName* = "VK_EXT_inline_uniform_block"

type
  PhysicalDeviceInlineUniformBlockFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceInlineUniformBlockFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    inlineUniformBlock*: Bool32
    descriptorBindingInlineUniformBlockUpdateAfterBind*: Bool32
  PhysicalDeviceInlineUniformBlockPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceInlineUniformBlockPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxInlineUniformBlockSize*: uint32
    maxPerStageDescriptorInlineUniformBlocks*: uint32
    maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks*: uint32
    maxDescriptorSetInlineUniformBlocks*: uint32
    maxDescriptorSetUpdateAfterBindInlineUniformBlocks*: uint32
  WriteDescriptorSetInlineUniformBlockEXT* = object
    sType* {.constant: (StructureType.writeDescriptorSetInlineUniformBlockExt).}: StructureType
    pNext* {.optional.}: pointer
    dataSize*: uint32
    pData* {.length: dataSize.}: pointer
  DescriptorPoolInlineUniformBlockCreateInfoEXT* = object
    sType* {.constant: (StructureType.descriptorPoolInlineUniformBlockCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    maxInlineUniformBlockBindings*: uint32



