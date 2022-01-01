# VK_EXT_primitive_topology_list_restart

import ../features/vk10
import ../platform
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



