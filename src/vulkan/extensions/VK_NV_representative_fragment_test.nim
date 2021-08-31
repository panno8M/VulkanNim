# Generated at 2021-08-31T05:18:46Z
# VK_NV_representative_fragment_test


import ../platform
import ../features/vk10

const
  NvRepresentativeFragmentTestSpecVersion* = 2
  NvRepresentativeFragmentTestExtensionName* = "VK_NV_representative_fragment_test"

type
  PhysicalDeviceRepresentativeFragmentTestFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    representativeFragmentTest*: Bool32
  PipelineRepresentativeFragmentTestStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    representativeFragmentTestEnable*: Bool32



