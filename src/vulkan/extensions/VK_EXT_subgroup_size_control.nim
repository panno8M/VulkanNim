
import ../platform
import ../features/vk10


type
  PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    requiredSubgroupSize*: uint32
  PhysicalDeviceSubgroupSizeControlPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    minSubgroupSize*: uint32
    maxSubgroupSize*: uint32
    maxComputeWorkgroupSubgroups*: uint32
    requiredSubgroupSizeStages*: ShaderStageFlags
  PhysicalDeviceSubgroupSizeControlFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    subgroupSizeControl*: Bool32
    computeFullSubgroups*: Bool32

const ExtSubgroupSizeControlExtensionName* = "VK_EXT_subgroup_size_control"
const ExtSubgroupSizeControlSpecVersion* = 2

