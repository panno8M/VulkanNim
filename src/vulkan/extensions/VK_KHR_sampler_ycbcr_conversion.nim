
import ../platform
import ../features/vk10
import VK_KHR_maintenance1
import VK_KHR_bind_memory2
import VK_KHR_get_memory_requirements2
import VK_KHR_get_physical_device_properties2


type
  ChromaLocationKHR* = UnusedEnum
  ImagePlaneMemoryRequirementsInfoKHR* = object
  PhysicalDeviceSamplerYcbcrConversionFeaturesKHR* = object
  SamplerYcbcrRangeKHR* = UnusedEnum
  BindImagePlaneMemoryInfoKHR* = object
  # TODO: [Unsupported Type]
  # (name: "VkSamplerYcbcrConversionKHR", kind: nkrType)
  SamplerYcbcrConversionInfoKHR* = object
  SamplerYcbcrConversionImageFormatPropertiesKHR* = object
  SamplerYcbcrConversionCreateInfoKHR* = object
  SamplerYcbcrModelConversionKHR* = UnusedEnum

const KhrSamplerYcbcrConversionExtensionName* = "VK_KHR_sampler_ycbcr_conversion"
const KhrSamplerYcbcrConversionSpecVersion* = 14
var # commands
  
  

const createSamplerYcbcrConversionKHR* = createSamplerYcbcrConversion

const destroySamplerYcbcrConversionKHR* = destroySamplerYcbcrConversion



proc loadVK_KHR_sampler_ycbcr_conversion*(instance: Instance) =
  instance.defineLoader(`<<`)

  createSamplerYcbcrConversionKHRCage << "vkCreateSamplerYcbcrConversionKHR"
  destroySamplerYcbcrConversionKHRCage << "vkDestroySamplerYcbcrConversionKHR"