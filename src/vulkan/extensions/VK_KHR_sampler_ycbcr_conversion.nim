# Generated at 2021-08-28T00:52:26Z
# VK_KHR_sampler_ycbcr_conversion
# =================================

import ../platform
import ../features/vk10
import VK_KHR_maintenance1
import VK_KHR_bind_memory2
import VK_KHR_get_memory_requirements2
import VK_KHR_get_physical_device_properties2


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
  SamplerYcbcrModelConversionKHR* = UnusedEnum
  SamplerYcbcrRangeKHR* = UnusedEnum
  ChromaLocationKHR* = UnusedEnum

var # commands
  
  
const createSamplerYcbcrConversionKHR* = createSamplerYcbcrConversion
const destroySamplerYcbcrConversionKHR* = destroySamplerYcbcrConversion
DebugReportObjectTypeEXT.defineAliases:
  SamplerYcbcrConversionExt as SamplerYcbcrConversionKhrExt

ObjectType.defineAliases:
  SamplerYcbcrConversion as SamplerYcbcrConversionKhr

SamplerYcbcrModelConversion.defineAliases:
  RgbIdentity as RgbIdentityKhr
  YcbcrIdentity as YcbcrIdentityKhr
  Ycbcr709 as Ycbcr709Khr
  Ycbcr601 as Ycbcr601Khr
  Ycbcr2020 as Ycbcr2020Khr

Format.defineAliases:
  G8b8g8r8422Unorm as G8b8g8r8422UnormKhr
  B8g8r8g8422Unorm as B8g8r8g8422UnormKhr
  G8B8R83plane420Unorm as G8B8R83plane420UnormKhr
  G8B8r82plane420Unorm as G8B8r82plane420UnormKhr
  G8B8R83plane422Unorm as G8B8R83plane422UnormKhr
  G8B8r82plane422Unorm as G8B8r82plane422UnormKhr
  G8B8R83plane444Unorm as G8B8R83plane444UnormKhr
  R10x6UnormPack16 as R10x6UnormPack16Khr
  R10x6g10x6Unorm2pack16 as R10x6g10x6Unorm2pack16Khr
  R10x6g10x6b10x6a10x6Unorm4pack16 as R10x6g10x6b10x6a10x6Unorm4pack16Khr
  G10x6b10x6g10x6r10x6422Unorm4pack16 as G10x6b10x6g10x6r10x6422Unorm4pack16Khr
  B10x6g10x6r10x6g10x6422Unorm4pack16 as B10x6g10x6r10x6g10x6422Unorm4pack16Khr
  G10x6B10x6R10x63plane420Unorm3pack16 as G10x6B10x6R10x63plane420Unorm3pack16Khr
  G10x6B10x6r10x62plane420Unorm3pack16 as G10x6B10x6r10x62plane420Unorm3pack16Khr
  G10x6B10x6R10x63plane422Unorm3pack16 as G10x6B10x6R10x63plane422Unorm3pack16Khr
  G10x6B10x6r10x62plane422Unorm3pack16 as G10x6B10x6r10x62plane422Unorm3pack16Khr
  G10x6B10x6R10x63plane444Unorm3pack16 as G10x6B10x6R10x63plane444Unorm3pack16Khr
  R12x4UnormPack16 as R12x4UnormPack16Khr
  R12x4g12x4Unorm2pack16 as R12x4g12x4Unorm2pack16Khr
  R12x4g12x4b12x4a12x4Unorm4pack16 as R12x4g12x4b12x4a12x4Unorm4pack16Khr
  G12x4b12x4g12x4r12x4422Unorm4pack16 as G12x4b12x4g12x4r12x4422Unorm4pack16Khr
  B12x4g12x4r12x4g12x4422Unorm4pack16 as B12x4g12x4r12x4g12x4422Unorm4pack16Khr
  G12x4B12x4R12x43plane420Unorm3pack16 as G12x4B12x4R12x43plane420Unorm3pack16Khr
  G12x4B12x4r12x42plane420Unorm3pack16 as G12x4B12x4r12x42plane420Unorm3pack16Khr
  G12x4B12x4R12x43plane422Unorm3pack16 as G12x4B12x4R12x43plane422Unorm3pack16Khr
  G12x4B12x4r12x42plane422Unorm3pack16 as G12x4B12x4r12x42plane422Unorm3pack16Khr
  G12x4B12x4R12x43plane444Unorm3pack16 as G12x4B12x4R12x43plane444Unorm3pack16Khr
  G16b16g16r16422Unorm as G16b16g16r16422UnormKhr
  B16g16r16g16422Unorm as B16g16r16g16422UnormKhr
  G16B16R163plane420Unorm as G16B16R163plane420UnormKhr
  G16B16r162plane420Unorm as G16B16r162plane420UnormKhr
  G16B16R163plane422Unorm as G16B16R163plane422UnormKhr
  G16B16r162plane422Unorm as G16B16r162plane422UnormKhr
  G16B16R163plane444Unorm as G16B16R163plane444UnormKhr

FormatFeatureFlagBits.defineAliases:
  MidpointChromaSamples as MidpointChromaSamplesBitKhr
  SampledImageYcbcrConversionLinearFilter as SampledImageYcbcrConversionLinearFilterBitKhr
  SampledImageYcbcrConversionSeparateReconstructionFilter as SampledImageYcbcrConversionSeparateReconstructionFilterBitKhr
  SampledImageYcbcrConversionChromaReconstructionExplicit as SampledImageYcbcrConversionChromaReconstructionExplicitBitKhr
  SampledImageYcbcrConversionChromaReconstructionExplicitForceable as SampledImageYcbcrConversionChromaReconstructionExplicitForceableBitKhr
  Disjoint as DisjointBitKhr
  CositedChromaSamples as CositedChromaSamplesBitKhr

StructureType.defineAliases:
  SamplerYcbcrConversionCreateInfo as SamplerYcbcrConversionCreateInfoKhr
  SamplerYcbcrConversionInfo as SamplerYcbcrConversionInfoKhr
  BindImagePlaneMemoryInfo as BindImagePlaneMemoryInfoKhr
  ImagePlaneMemoryRequirementsInfo as ImagePlaneMemoryRequirementsInfoKhr
  PhysicalDeviceSamplerYcbcrConversionFeatures as PhysicalDeviceSamplerYcbcrConversionFeaturesKhr
  SamplerYcbcrConversionImageFormatProperties as SamplerYcbcrConversionImageFormatPropertiesKhr

ChromaLocation.defineAliases:
  CositedEven as CositedEvenKhr
  Midpoint as MidpointKhr

ImageCreateFlagBits.defineAliases:
  Disjoint as DisjointBitKhr

SamplerYcbcrRange.defineAliases:
  ItuFull as ItuFullKhr
  ItuNarrow as ItuNarrowKhr

ImageAspectFlagBits.defineAliases:
  Plane0 as Plane0BitKhr
  Plane1 as Plane1BitKhr
  Plane2 as Plane2BitKhr

proc loadVK_KHR_sampler_ycbcr_conversion*(instance: Instance) =
  instance.defineLoader(`<<`)

  createSamplerYcbcrConversionKHRCage << "vkCreateSamplerYcbcrConversionKHR"
  destroySamplerYcbcrConversionKHRCage << "vkDestroySamplerYcbcrConversionKHR"