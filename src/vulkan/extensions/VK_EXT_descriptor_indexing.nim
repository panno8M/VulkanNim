
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_maintenance3


type
  PhysicalDeviceDescriptorIndexingFeaturesEXT* = object
  DescriptorBindingFlagBitsEXT* = UnusedEnum
  # TODO: [Unsupported Type]
  # (name: "VkDescriptorBindingFlagsEXT", kind: nkrType)
  DescriptorSetLayoutBindingFlagsCreateInfoEXT* = object
  DescriptorSetVariableDescriptorCountAllocateInfoEXT* = object
  PhysicalDeviceDescriptorIndexingPropertiesEXT* = object
  DescriptorSetVariableDescriptorCountLayoutSupportEXT* = object

const ExtDescriptorIndexingExtensionName* = "VK_EXT_descriptor_indexing"
const ExtDescriptorIndexingSpecVersion* = 2

