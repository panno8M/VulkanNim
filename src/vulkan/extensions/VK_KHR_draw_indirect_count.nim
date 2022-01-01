# VK_KHR_draw_indirect_count

import ../features/vk10
import ../features/vk12
import ../platform
prepareVulkanLibDef()

const
  KhrDrawIndirectCountSpecVersion* = 1
  KhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"

const cmdDrawIndirectCountKHR* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountKHR* = cmdDrawIndexedIndirectCount

