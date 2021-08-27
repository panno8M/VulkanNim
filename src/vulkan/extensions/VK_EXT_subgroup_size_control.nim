# Generated at 2021-08-27T06:01:03Z
# VK_EXT_subgroup_size_control
# =================================

import ../platform
import ../features/vk10


const
  ExtSubgroupSizeControlSpecVersion* = 2
  ExtSubgroupSizeControlExtensionName* = "VK_EXT_subgroup_size_control"

type
  PhysicalDeviceSubgroupSizeControlFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    subgroupSizeControl*: Bool32
    computeFullSubgroups*: Bool32
  PhysicalDeviceSubgroupSizeControlPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    minSubgroupSize*: uint32
    maxSubgroupSize*: uint32
    maxComputeWorkgroupSubgroups*: uint32
    requiredSubgroupSizeStages*: ShaderStageFlags
  PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    requiredSubgroupSize*: uint32


