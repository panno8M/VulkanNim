# Generated at 2021-12-25T14:19:30Z
# VK_NV_representative_fragment_test

import ../platform
import ../features/vk10

prepareVulkanLibDef()

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



