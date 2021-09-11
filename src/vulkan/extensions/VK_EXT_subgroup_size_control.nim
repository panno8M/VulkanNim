# Generated at 2021-09-10T05:27:58Z
# VK_EXT_subgroup_size_control


import ../platform
import ../features/vk10

const
  ExtSubgroupSizeControlSpecVersion* = 2
  ExtSubgroupSizeControlExtensionName* = "VK_EXT_subgroup_size_control"

type
  PhysicalDeviceSubgroupSizeControlFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceSubgroupSizeControlFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    subgroupSizeControl*: Bool32
    computeFullSubgroups*: Bool32
  PhysicalDeviceSubgroupSizeControlPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceSubgroupSizeControlPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    minSubgroupSize*: uint32
    maxSubgroupSize*: uint32
    maxComputeWorkgroupSubgroups*: uint32
    requiredSubgroupSizeStages*: ShaderStageFlags
  PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineShaderStageRequiredSubgroupSizeCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    requiredSubgroupSize*: uint32



