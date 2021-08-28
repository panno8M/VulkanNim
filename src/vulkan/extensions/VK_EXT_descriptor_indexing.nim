# Generated at 2021-08-28T00:52:26Z
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
  DescriptorBindingFlagBitsEXT* = UnusedEnum
  {name}* = {Alias}

DescriptorPoolCreateFlagBits.defineAliases:
  UpdateAfterBind as UpdateAfterBindBitExt

Result.defineAliases:
  ErrorFragmentation as ErrorFragmentationExt

StructureType.defineAliases:
  DescriptorSetLayoutBindingFlagsCreateInfo as DescriptorSetLayoutBindingFlagsCreateInfoExt
  PhysicalDeviceDescriptorIndexingFeatures as PhysicalDeviceDescriptorIndexingFeaturesExt
  PhysicalDeviceDescriptorIndexingProperties as PhysicalDeviceDescriptorIndexingPropertiesExt
  DescriptorSetVariableDescriptorCountAllocateInfo as DescriptorSetVariableDescriptorCountAllocateInfoExt
  DescriptorSetVariableDescriptorCountLayoutSupport as DescriptorSetVariableDescriptorCountLayoutSupportExt

DescriptorBindingFlagBits.defineAliases:
  UpdateAfterBind as UpdateAfterBindBitExt
  UpdateUnusedWhilePending as UpdateUnusedWhilePendingBitExt
  PartiallyBound as PartiallyBoundBitExt
  VariableDescriptorCount as VariableDescriptorCountBitExt

DescriptorSetLayoutCreateFlagBits.defineAliases:
  UpdateAfterBindPool as UpdateAfterBindPoolBitExt

