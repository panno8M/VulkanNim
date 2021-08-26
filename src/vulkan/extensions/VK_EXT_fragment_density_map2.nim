
import ../platform
import ../features/vk10
import VK_EXT_fragment_density_map




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


