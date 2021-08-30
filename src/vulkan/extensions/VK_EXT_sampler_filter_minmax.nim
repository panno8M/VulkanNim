# Generated at 2021-08-30T23:05:46Z
# VK_EXT_sampler_filter_minmax


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12

const
  ExtSamplerFilterMinmaxSpecVersion* = 2
  ExtSamplerFilterMinmaxExtensionName* = "VK_EXT_sampler_filter_minmax"

type
  SamplerReductionModeEXT* = distinct UnusedEnum
  SamplerReductionModeCreateInfoEXT* = object
  PhysicalDeviceSamplerFilterMinmaxPropertiesEXT* = object

FormatFeatureFlagBits.defineAliases:
  sampledImageFilterMinmax as sampledImageFilterMinmaxExt

StructureType.defineAliases:
  physicalDeviceSamplerFilterMinmaxProperties as physicalDeviceSamplerFilterMinmaxPropertiesExt
  samplerReductionModeCreateInfo as samplerReductionModeCreateInfoExt

SamplerReductionMode.defineAliases:
  weightedAverage as weightedAverageExt
  min as minExt
  max as maxExt

