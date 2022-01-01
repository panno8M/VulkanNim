# VK_KHR_sampler_ycbcr_conversion

import ../features/vk10
import VK_KHR_maintenance1
import VK_KHR_bind_memory2
import VK_KHR_get_memory_requirements2
import VK_KHR_get_physical_device_properties2
import ../features/vk11
import ../platform
import VK_EXT_debug_report
prepareVulkanLibDef()

const
  KhrSamplerYcbcrConversionSpecVersion* = 14
  KhrSamplerYcbcrConversionExtensionName* = "VK_KHR_sampler_ycbcr_conversion"

type
  SamplerYcbcrConversionCreateInfoKHR* = object
  SamplerYcbcrConversionInfoKHR* = object
  BindImagePlaneMemoryInfoKHR* = object
  ImagePlaneMemoryRequirementsInfoKHR* = object
  PhysicalDeviceSamplerYcbcrConversionFeaturesKHR* = object
  SamplerYcbcrConversionImageFormatPropertiesKHR* = object

const createSamplerYcbcrConversionKHR* = createSamplerYcbcrConversion
const destroySamplerYcbcrConversionKHR* = destroySamplerYcbcrConversion

