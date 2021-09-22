# Generated at 2021-09-22T15:02:54Z
# VK_NV_representative_fragment_test


import ../platform
import ../features/vk10

const
  NvRepresentativeFragmentTestSpecVersion* = 2
  NvRepresentativeFragmentTestExtensionName* = "VK_NV_representative_fragment_test"

type
  PhysicalDeviceRepresentativeFragmentTestFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceRepresentativeFragmentTestFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    representativeFragmentTest*: Bool32
  PipelineRepresentativeFragmentTestStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineRepresentativeFragmentTestStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    representativeFragmentTestEnable*: Bool32



