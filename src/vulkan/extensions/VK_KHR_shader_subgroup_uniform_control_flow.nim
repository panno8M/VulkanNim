# Generated at 2021-12-26T16:57:01Z
# VK_KHR_shader_subgroup_uniform_control_flow

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  KhrShaderSubgroupUniformControlFlowSpecVersion* = 1
  KhrShaderSubgroupUniformControlFlowExtensionName* = "VK_KHR_shader_subgroup_uniform_control_flow"

type
  PhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderSubgroupUniformControlFlowFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderSubgroupUniformControlFlow*: Bool32



