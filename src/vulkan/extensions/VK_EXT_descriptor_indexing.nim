# Generated at 2021-08-31T05:18:45Z
# VK_EXT_descriptor_indexing


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_maintenance3
import ../features/vk12
export VK_KHR_get_physical_device_properties2
export VK_KHR_maintenance3

const
  ExtDescriptorIndexingSpecVersion* = 2
  ExtDescriptorIndexingExtensionName* = "VK_EXT_descriptor_indexing"

type # enums and bitmasks
  DescriptorBindingFlagBitsEXT* = distinct UnusedEnum
  DescriptorBindingFlagsEXT* = DescriptorBindingFlags

type
  DescriptorSetLayoutBindingFlagsCreateInfoEXT* = object
  PhysicalDeviceDescriptorIndexingFeaturesEXT* = object
  PhysicalDeviceDescriptorIndexingPropertiesEXT* = object
  DescriptorSetVariableDescriptorCountAllocateInfoEXT* = object
  DescriptorSetVariableDescriptorCountLayoutSupportEXT* = object

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


