
import ../platform
import ../features/vk10




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


