# Generated at 2021-09-09T01:49:36Z
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



