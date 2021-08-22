
import ../platform
import ../features/vk10
import VK_EXT_fragment_density_map


type
  PhysicalDeviceFragmentDensityMap2PropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    subsampledLoads*: Bool32
    subsampledCoarseReconstructionEarlyAccess*: Bool32
    maxSubsampledArrayLayers*: uint32
    maxDescriptorSetSubsampledSamplers*: uint32
  PhysicalDeviceFragmentDensityMap2FeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    fragmentDensityMapDeferred*: Bool32

const ExtFragmentDensityMap2SpecVersion* = 1
const ExtFragmentDensityMap2ExtensionName* = "VK_EXT_fragment_density_map2"

