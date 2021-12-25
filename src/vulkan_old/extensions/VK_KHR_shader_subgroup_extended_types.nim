# Generated at 2021-10-24T02:03:03Z
# VK_KHR_shader_subgroup_extended_types

import ../platform
import ../features/vk10
import ../features/vk12

prepareVulkanLibDef()

const
  KhrShaderSubgroupExtendedTypesSpecVersion* = 1
  KhrShaderSubgroupExtendedTypesExtensionName* = "VK_KHR_shader_subgroup_extended_types"

type
  PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR* = object

StructureType.defineAliases:
  physicalDeviceShaderSubgroupExtendedTypesFeatures as physicalDeviceShaderSubgroupExtendedTypesFeaturesKhr


