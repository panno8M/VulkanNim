# Generated at 2021-08-28T00:52:26Z
# VK_EXT_sampler_filter_minmax
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtSamplerFilterMinmaxSpecVersion* = 2
  ExtSamplerFilterMinmaxExtensionName* = "VK_EXT_sampler_filter_minmax"

type
  SamplerReductionModeEXT* = UnusedEnum
  SamplerReductionModeCreateInfoEXT* = object
  PhysicalDeviceSamplerFilterMinmaxPropertiesEXT* = object

FormatFeatureFlagBits.defineAliases:
  SampledImageFilterMinmax as SampledImageFilterMinmaxBitExt

StructureType.defineAliases:
  PhysicalDeviceSamplerFilterMinmaxProperties as PhysicalDeviceSamplerFilterMinmaxPropertiesExt
  SamplerReductionModeCreateInfo as SamplerReductionModeCreateInfoExt

SamplerReductionMode.defineAliases:
  WeightedAverage as WeightedAverageExt
  Min as MinExt
  Max as MaxExt

