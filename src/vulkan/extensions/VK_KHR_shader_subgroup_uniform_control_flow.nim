# VK_KHR_shader_subgroup_uniform_control_flow

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrShaderSubgroupUniformControlFlowSpecVersion* = 1
  KhrShaderSubgroupUniformControlFlowExtensionName* = "VK_KHR_shader_subgroup_uniform_control_flow"

type
  PhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderSubgroupUniformControlFlowFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderSubgroupUniformControlFlow*: Bool32



