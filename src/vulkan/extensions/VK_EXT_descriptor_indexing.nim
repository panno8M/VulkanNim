# Generated at 2021-08-28T12:28:01Z
# VK_EXT_descriptor_indexing
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_maintenance3


const
  ExtDescriptorIndexingSpecVersion* = 2
  ExtDescriptorIndexingExtensionName* = "VK_EXT_descriptor_indexing"

type
  DescriptorSetLayoutBindingFlagsCreateInfoEXT* = object
  PhysicalDeviceDescriptorIndexingFeaturesEXT* = object
  PhysicalDeviceDescriptorIndexingPropertiesEXT* = object
  DescriptorSetVariableDescriptorCountAllocateInfoEXT* = object
  DescriptorSetVariableDescriptorCountLayoutSupportEXT* = object
  DescriptorBindingFlagBitsEXT* = distinct UnusedEnum
  {name}* = {Alias}

DescriptorPoolCreateFlagBits.defineAliases:
  updateAfterBind as updateAfterBindExt

Result.defineAliases:
  errorFragmentation as errorFragmentationExt

StructureType.defineAliases:
  descriptorSetLayoutBindingFlagsCreateInfo as descriptorSetLayoutBindingFlagsCreateInfoExt
  physicalDeviceDescriptorIndexingFeatures as physicalDeviceDescriptorIndexingFeaturesExt
  physicalDeviceDescriptorIndexingProperties as physicalDeviceDescriptorIndexingPropertiesExt
  descriptorSetVariableDescriptorCountAllocateInfo as descriptorSetVariableDescriptorCountAllocateInfoExt
  descriptorSetVariableDescriptorCountLayoutSupport as descriptorSetVariableDescriptorCountLayoutSupportExt

DescriptorBindingFlagBits.defineAliases:
  updateAfterBind as updateAfterBindExt
  updateUnusedWhilePending as updateUnusedWhilePendingExt
  partiallyBound as partiallyBoundExt
  variableDescriptorCount as variableDescriptorCountExt

DescriptorSetLayoutCreateFlagBits.defineAliases:
  updateAfterBindPool as updateAfterBindPoolExt


