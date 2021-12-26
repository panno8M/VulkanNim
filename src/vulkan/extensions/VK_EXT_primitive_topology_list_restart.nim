# Generated at 2021-12-26T16:57:02Z
# VK_EXT_primitive_topology_list_restart

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  ExtPrimitiveTopologyListRestartSpecVersion* = 1
  ExtPrimitiveTopologyListRestartExtensionName* = "VK_EXT_primitive_topology_list_restart"

type
  PhysicalDevicePrimitiveTopologyListRestartFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDevicePrimitiveTopologyListRestartFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    primitiveTopologyListRestart*: Bool32
    primitiveTopologyPatchListRestart*: Bool32



