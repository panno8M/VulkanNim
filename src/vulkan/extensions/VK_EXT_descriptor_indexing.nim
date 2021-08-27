
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


