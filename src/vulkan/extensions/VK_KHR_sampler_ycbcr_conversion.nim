
import ../platform
import ../features/vk10
import VK_KHR_maintenance1
import VK_KHR_bind_memory2
import VK_KHR_get_memory_requirements2
import VK_KHR_get_physical_device_properties2




type
  SamplerYcbcrConversionCreateInfoKHR* = object
  SamplerYcbcrConversionInfoKHR* = object
  BindImagePlaneMemoryInfoKHR* = object
  ImagePlaneMemoryRequirementsInfoKHR* = object
  PhysicalDeviceSamplerYcbcrConversionFeaturesKHR* = object
  SamplerYcbcrConversionImageFormatPropertiesKHR* = object
  SamplerYcbcrConversionKHR* = SamplerYcbcrConversion
  SamplerYcbcrModelConversionKHR* = UnusedEnum
  SamplerYcbcrRangeKHR* = UnusedEnum
  ChromaLocationKHR* = UnusedEnum

var # commands
  
  
const createSamplerYcbcrConversionKHR* = createSamplerYcbcrConversion
const destroySamplerYcbcrConversionKHR* = destroySamplerYcbcrConversion
proc loadVK_KHR_sampler_ycbcr_conversion*(instance: Instance) =
  instance.defineLoader(`<<`)

  createSamplerYcbcrConversionKHRCage << "vkCreateSamplerYcbcrConversionKHR"
  destroySamplerYcbcrConversionKHRCage << "vkDestroySamplerYcbcrConversionKHR"