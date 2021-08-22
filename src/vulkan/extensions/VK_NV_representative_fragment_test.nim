
import ../platform
import ../features/vk10


type
  PhysicalDeviceRepresentativeFragmentTestFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    representativeFragmentTest*: Bool32
  PipelineRepresentativeFragmentTestStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    representativeFragmentTestEnable*: Bool32

const NvRepresentativeFragmentTestSpecVersion* = 2
const NvRepresentativeFragmentTestExtensionName* = "VK_NV_representative_fragment_test"

