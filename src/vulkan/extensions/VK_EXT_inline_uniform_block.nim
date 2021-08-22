
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_maintenance1


type
  DescriptorPoolInlineUniformBlockCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxInlineUniformBlockBindings*: uint32
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

const ExtInlineUniformBlockExtensionName* = "VK_EXT_inline_uniform_block"
const ExtInlineUniformBlockSpecVersion* = 1

