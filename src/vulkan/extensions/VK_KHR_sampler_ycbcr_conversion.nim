# Generated at 2021-08-30T14:31:10Z
# VK_KHR_sampler_ycbcr_conversion


import ../platform
import ../features/vk10
import ./VK_KHR_maintenance1
import ./VK_KHR_bind_memory2
import ./VK_KHR_get_memory_requirements2
import ./VK_KHR_get_physical_device_properties2

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
  SamplerYcbcrConversionKHR* = SamplerYcbcrConversion
  SamplerYcbcrModelConversionKHR* = distinct UnusedEnum
  SamplerYcbcrRangeKHR* = distinct UnusedEnum
  ChromaLocationKHR* = distinct UnusedEnum

var # commands
  
  
const createSamplerYcbcrConversionKHR* = createSamplerYcbcrConversion
const destroySamplerYcbcrConversionKHR* = destroySamplerYcbcrConversion
DebugReportObjectTypeEXT.defineAliases:
  samplerYcbcrConversionExt as samplerYcbcrConversionKhrExt

ObjectType.defineAliases:
  samplerYcbcrConversion as samplerYcbcrConversionKhr

SamplerYcbcrModelConversion.defineAliases:
  rgbIdentity as rgbIdentityKhr
  ycbcrIdentity as ycbcrIdentityKhr
  ycbcr709 as ycbcr709Khr
  ycbcr601 as ycbcr601Khr
  ycbcr2020 as ycbcr2020Khr

Format.defineAliases:
  g8b8g8r8422Unorm as g8b8g8r8422UnormKhr
  b8g8r8g8422Unorm as b8g8r8g8422UnormKhr
  g8B8R83plane420Unorm as g8B8R83plane420UnormKhr
  g8B8r82plane420Unorm as g8B8r82plane420UnormKhr
  g8B8R83plane422Unorm as g8B8R83plane422UnormKhr
  g8B8r82plane422Unorm as g8B8r82plane422UnormKhr
  g8B8R83plane444Unorm as g8B8R83plane444UnormKhr
  r10x6UnormPack16 as r10x6UnormPack16Khr
  r10x6g10x6Unorm2pack16 as r10x6g10x6Unorm2pack16Khr
  r10x6g10x6b10x6a10x6Unorm4pack16 as r10x6g10x6b10x6a10x6Unorm4pack16Khr
  g10x6b10x6g10x6r10x6422Unorm4pack16 as g10x6b10x6g10x6r10x6422Unorm4pack16Khr
  b10x6g10x6r10x6g10x6422Unorm4pack16 as b10x6g10x6r10x6g10x6422Unorm4pack16Khr
  g10x6B10x6R10x63plane420Unorm3pack16 as g10x6B10x6R10x63plane420Unorm3pack16Khr
  g10x6B10x6r10x62plane420Unorm3pack16 as g10x6B10x6r10x62plane420Unorm3pack16Khr
  g10x6B10x6R10x63plane422Unorm3pack16 as g10x6B10x6R10x63plane422Unorm3pack16Khr
  g10x6B10x6r10x62plane422Unorm3pack16 as g10x6B10x6r10x62plane422Unorm3pack16Khr
  g10x6B10x6R10x63plane444Unorm3pack16 as g10x6B10x6R10x63plane444Unorm3pack16Khr
  r12x4UnormPack16 as r12x4UnormPack16Khr
  r12x4g12x4Unorm2pack16 as r12x4g12x4Unorm2pack16Khr
  r12x4g12x4b12x4a12x4Unorm4pack16 as r12x4g12x4b12x4a12x4Unorm4pack16Khr
  g12x4b12x4g12x4r12x4422Unorm4pack16 as g12x4b12x4g12x4r12x4422Unorm4pack16Khr
  b12x4g12x4r12x4g12x4422Unorm4pack16 as b12x4g12x4r12x4g12x4422Unorm4pack16Khr
  g12x4B12x4R12x43plane420Unorm3pack16 as g12x4B12x4R12x43plane420Unorm3pack16Khr
  g12x4B12x4r12x42plane420Unorm3pack16 as g12x4B12x4r12x42plane420Unorm3pack16Khr
  g12x4B12x4R12x43plane422Unorm3pack16 as g12x4B12x4R12x43plane422Unorm3pack16Khr
  g12x4B12x4r12x42plane422Unorm3pack16 as g12x4B12x4r12x42plane422Unorm3pack16Khr
  g12x4B12x4R12x43plane444Unorm3pack16 as g12x4B12x4R12x43plane444Unorm3pack16Khr
  g16b16g16r16422Unorm as g16b16g16r16422UnormKhr
  b16g16r16g16422Unorm as b16g16r16g16422UnormKhr
  g16B16R163plane420Unorm as g16B16R163plane420UnormKhr
  g16B16r162plane420Unorm as g16B16r162plane420UnormKhr
  g16B16R163plane422Unorm as g16B16R163plane422UnormKhr
  g16B16r162plane422Unorm as g16B16r162plane422UnormKhr
  g16B16R163plane444Unorm as g16B16R163plane444UnormKhr

FormatFeatureFlagBits.defineAliases:
  midpointChromaSamples as midpointChromaSamplesKhr
  sampledImageYcbcrConversionLinearFilter as sampledImageYcbcrConversionLinearFilterKhr
  sampledImageYcbcrConversionSeparateReconstructionFilter as sampledImageYcbcrConversionSeparateReconstructionFilterKhr
  sampledImageYcbcrConversionChromaReconstructionExplicit as sampledImageYcbcrConversionChromaReconstructionExplicitKhr
  sampledImageYcbcrConversionChromaReconstructionExplicitForceable as sampledImageYcbcrConversionChromaReconstructionExplicitForceableKhr
  disjoint as disjointKhr
  cositedChromaSamples as cositedChromaSamplesKhr

StructureType.defineAliases:
  samplerYcbcrConversionCreateInfo as samplerYcbcrConversionCreateInfoKhr
  samplerYcbcrConversionInfo as samplerYcbcrConversionInfoKhr
  bindImagePlaneMemoryInfo as bindImagePlaneMemoryInfoKhr
  imagePlaneMemoryRequirementsInfo as imagePlaneMemoryRequirementsInfoKhr
  physicalDeviceSamplerYcbcrConversionFeatures as physicalDeviceSamplerYcbcrConversionFeaturesKhr
  samplerYcbcrConversionImageFormatProperties as samplerYcbcrConversionImageFormatPropertiesKhr

ChromaLocation.defineAliases:
  cositedEven as cositedEvenKhr
  midpoint as midpointKhr

ImageCreateFlagBits.defineAliases:
  disjoint as disjointKhr

SamplerYcbcrRange.defineAliases:
  ituFull as ituFullKhr
  ituNarrow as ituNarrowKhr

ImageAspectFlagBits.defineAliases:
  plane0 as plane0Khr
  plane1 as plane1Khr
  plane2 as plane2Khr

proc loadVK_KHR_sampler_ycbcr_conversion*(instance: Instance) =
  instance.defineLoader(`<<`)

  createSamplerYcbcrConversionKHRCage << "vkCreateSamplerYcbcrConversionKHR"
  destroySamplerYcbcrConversionKHRCage << "vkDestroySamplerYcbcrConversionKHR"