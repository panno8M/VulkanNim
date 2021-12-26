# Generated at 2021-12-26T10:42:47Z
# VK_EXT_fragment_density_map2

import ../platform

import ../features/vk10
import ./VK_EXT_fragment_density_map
export VK_EXT_fragment_density_map
prepareVulkanLibDef()

const
  ExtFragmentDensityMap2SpecVersion* = 1
  ExtFragmentDensityMap2ExtensionName* = "VK_EXT_fragment_density_map2"

type
  PhysicalDeviceFragmentDensityMap2FeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentDensityMap2FeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    fragmentDensityMapDeferred*: Bool32
  PhysicalDeviceFragmentDensityMap2PropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentDensityMap2PropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    subsampledLoads*: Bool32
    subsampledCoarseReconstructionEarlyAccess*: Bool32
    maxSubsampledArrayLayers*: uint32
    maxDescriptorSetSubsampledSamplers*: uint32



