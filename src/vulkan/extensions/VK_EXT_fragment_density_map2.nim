# Generated at 2021-08-31T05:18:46Z
# VK_EXT_fragment_density_map2


import ../platform
import ../features/vk10
import ./VK_EXT_fragment_density_map
export VK_EXT_fragment_density_map

const
  ExtFragmentDensityMap2SpecVersion* = 1
  ExtFragmentDensityMap2ExtensionName* = "VK_EXT_fragment_density_map2"

type
  PhysicalDeviceFragmentDensityMap2FeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    fragmentDensityMapDeferred*: Bool32
  PhysicalDeviceFragmentDensityMap2PropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    subsampledLoads*: Bool32
    subsampledCoarseReconstructionEarlyAccess*: Bool32
    maxSubsampledArrayLayers*: uint32
    maxDescriptorSetSubsampledSamplers*: uint32



