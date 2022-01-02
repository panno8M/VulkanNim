# VK_EXT_descriptor_indexing

import ../features/vk10
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  ExtDescriptorIndexingSpecVersion* = 2
  ExtDescriptorIndexingExtensionName* = "VK_EXT_descriptor_indexing"

type
  DescriptorSetLayoutBindingFlagsCreateInfoEXT* = object
  PhysicalDeviceDescriptorIndexingFeaturesEXT* = object
  PhysicalDeviceDescriptorIndexingPropertiesEXT* = object
  DescriptorSetVariableDescriptorCountAllocateInfoEXT* = object
  DescriptorSetVariableDescriptorCountLayoutSupportEXT* = object



